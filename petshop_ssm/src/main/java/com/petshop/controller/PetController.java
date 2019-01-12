package com.petshop.controller;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.petshop.biz_inteface.IPetBiz;
import com.petshop.biz_inteface.IPetownerBiz;
import com.petshop.biz_inteface.IPetstoreBiz;
import com.petshop.model.Pet;
import com.petshop.model.Petowner;
import com.petshop.model.Petstore;

@Controller
@RequestMapping(value = "/pet")
public class PetController {

	@Resource(name = "PetBizImpl")
	IPetBiz ipb;
	@Resource(name = "PetownerBizImpl")
	IPetownerBiz ipob;
	@Resource(name = "PetstoreBizImpl")
	IPetstoreBiz ipsb;

	@Resource
	WebApplicationContext wac;

	@RequestMapping("/List_vue")
	@ResponseBody
	public List<Pet> petList_vue() {

		return ipb.getAll();
	}

	@RequiresPermissions("pet:view")
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String petList(@RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage,
			Integer pageSize, Model model) {

		String s_pageSize = wac.getServletContext().getInitParameter("pageSize");
		pageSize = Integer.parseInt(s_pageSize);

		model.addAttribute("page", ipb.findByPage(currentPage, pageSize));
		return "/pet/petList";
	}

	@RequiresPermissions("pet:add")
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String petAdd(Model model) {

		List<Petowner> list = ipob.getAll();
		List<Petstore> list2 = ipsb.getAll();

		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		return "/pet/petAdd";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String petAdd(@RequestParam("photo_") CommonsMultipartFile photo_,Pet pet,HttpServletRequest request) throws Exception {

		String vir_path = "/Public/img/"+new Date().getTime()+photo_.getOriginalFilename();
		String act_path = request.getRealPath(vir_path);
		
		File newPhoto = new File(act_path);
		photo_.transferTo(newPhoto);
		
		pet.setPhoto(vir_path);
		ipb.insertSelective(pet);
		return "redirect:/pet/list";
	}

	@RequiresPermissions("pet:edit")
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String petEdit(Model model, int id) {

		Pet pet = ipb.selectByPrimaryKey(id);

		model.addAttribute("pet", pet);

		List<Petowner> list = ipob.getAll();
		List<Petstore> list2 = ipsb.getAll();

		model.addAttribute("list", list);
		model.addAttribute("list2", list2);

		return "/pet/petEdit";
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public String petEdit(Pet pet) {

		ipb.updateByPrimaryKeySelective(pet);

		return "redirect:/pet/list";
	}

	@RequiresPermissions("pet:delete")
	@RequestMapping(value = "/del")
	public String petDelete(int id) {

		ipb.deleteByPrimaryKey(id);

		return "redirect:/pet/list";
	}
}
