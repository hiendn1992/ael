package com.vn.ael.webapp.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.vn.ael.constants.URLReference;
import com.vn.ael.enums.ConfigurationType;
import com.vn.ael.enums.ServicesType;
import com.vn.ael.persistence.entity.Exhibition;
import com.vn.ael.persistence.entity.Inland;
import com.vn.ael.persistence.manager.DocsgeneralManager;
import com.vn.ael.persistence.manager.ExhibitionManager;
import com.vn.ael.webapp.dto.DocsSelection;

@Controller
@RequestMapping(URLReference.EXHIBITION_FORM)
public class ExhibitionFormController extends BaseFormController {

	private ExhibitionManager exhibitionManager = null;
	
	private DocsgeneralManager docsgeneralManager;
	
	@Autowired
	public void setDocsgeneralManager(final DocsgeneralManager docsgeneralManager) {
		this.docsgeneralManager = docsgeneralManager;
	}

    @Autowired
    public void setExhibitionManager(final ExhibitionManager exhibitionManager) {
        this.exhibitionManager = exhibitionManager;
    }
    
    public ExhibitionFormController() {
        setCancelView("redirect:"+URLReference.EXHIBITION_LIST);
        setSuccessView("redirect:"+URLReference.EXHIBITION_LIST);
    }
 
    @RequestMapping(method = RequestMethod.GET)
    protected ModelAndView showForm(HttpServletRequest request)
    throws Exception {
        String id = request.getParameter("id");
        Exhibition exhibition = null;
        if (!StringUtils.isBlank(id)) {
        	exhibition = exhibitionManager.findWholeObjects(id);
        }else{
        	exhibition= new Exhibition();
        }
        docsgeneralManager.updateChilds(exhibition.getDocsgeneral());
        ModelAndView mav = new ModelAndView(URLReference.EXHIBITION_FORM);
        mav.addObject("exhibition", exhibition);
        DocsSelection docsSelection = configurationManager.loadSelectionForDocsPage(
        		ConfigurationType.EXH_TYPE_OF_EXH,
        		ConfigurationType.DOCS_TYPE_OF_CONTAINER,
        		ConfigurationType.DOCS_SHIPPING_LINE,
        		ConfigurationType.EXH_OPERATOR,
        		ConfigurationType.DOCS_SHIPPING_CUSTOM_DEPT,
        		ConfigurationType.DOCS_TYPE_OF_CONTAINER_CONT,
        		ConfigurationType.EXH_MASTER_FEE,
        		ConfigurationType.FEE_NAMES
        		);
        mav.addObject("docsSelection", docsSelection);
        return mav;
    }
 
    @RequestMapping(method = RequestMethod.POST)
    public String onSubmit(Exhibition exhibition, BindingResult errors, HttpServletRequest request,
                           HttpServletResponse response)
    throws Exception {
        if (request.getParameter("cancel") != null) {
            return getCancelView();
        }
 
        if (validator != null) { // validator is null during testing
            validator.validate(exhibition, errors);
 
            if (errors.hasErrors() && request.getParameter("delete") == null) { // don't validate when deleting
                return URLReference.EXHIBITION_FORM;
            }
        }
 
        log.debug("entering 'onSubmit' method...");
 
        boolean isNew = (exhibition.getId() == null);
        String success = getSuccessView();
        Locale locale = request.getLocale();
 
        if (request.getParameter("delete") != null) {
            exhibitionManager.removeWholeExh(exhibition);
            saveMessage(request, getText("exhibition.deleted", locale));
        } else {
        	getEntityService().checkUpdateInfo(exhibition, isNew, request);
        	docsgeneralManager.checkToDeleteChilds(exhibition.getDocsgeneral());
        	exhibitionManager.saveWholeExh(exhibition);
            String key = (isNew) ? "exhibition.added" : "exhibition.updated";
            saveMessage(request, getText(key, locale));
 
            if (!isNew) {
                success = "redirect:"+URLReference.EXHIBITION_FORM+"?id=" + exhibition.getId();
            }
        }
 
        return success;
    }
    
//    @RequestMapping(method = RequestMethod.POST, value= URLReference.INLAND_SIZES_FORM)
//    @ResponseBody
//    public JsonResponse submitInlandSizes(@RequestBody Inlandsize inlandsize, BindingResult errors, HttpServletRequest request,
//                           HttpServletResponse response)
//    throws Exception {
//        Locale locale = request.getLocale();
//        if (validator != null) { // validator is null during testing
//            validator.validate(inlandsize, errors);
// 
//            if (errors.hasErrors() && request.getParameter("delete") == null) { // don't validate when deleting
//                return JsonResponse.getErrorMessage(getText("inlandSize.updateFail", locale));
//            }
//        }
// 
//        log.debug("entering 'onSubmit' method...");
// 
//        boolean isNew = (inlandsize.getId() == null);
// 
//        if (request.getParameter("delete") != null) {
//            inlandsizeManager.remove(inlandsize);
//            return JsonResponse.getSuccessMessage(getText("inland.deleted", locale));
//        } else {
////        	getEntityService().checkUpdateInfo(inlandsize, isNew, request);
//        	inlandsizeManager.save(inlandsize);
//            String key = (isNew) ? "inland.added" : "inland.updated";
//            return JsonResponse.getSuccessMessage(getText(key, locale));
//        }
//    }

}
