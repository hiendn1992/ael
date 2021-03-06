package com.vn.ael.webapp.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.vn.ael.constants.URLReference;
import com.vn.ael.enums.ServicesType;
import com.vn.ael.persistence.entity.Docsgeneral;
import com.vn.ael.persistence.entity.OfferPrice;
import com.vn.ael.persistence.manager.CustomerManager;
import com.vn.ael.persistence.manager.DocsgeneralManager;
import com.vn.ael.persistence.manager.OfferPriceManager;
import com.vn.ael.persistence.service.AccountingTransService;
import com.vn.ael.webapp.dto.AccountingTrans;
import com.vn.ael.webapp.dto.AccountingTransCondition;

@Controller
@RequestMapping(URLReference.ACCOUNTING_TRANSPORT+"*")
public class AccountingTransportController extends BaseFormController {

	private OfferPriceManager offerpriceManager;

    @Autowired
    public void setOfferpriceManager(final OfferPriceManager offerpriceManager) {
        this.offerpriceManager = offerpriceManager;
    }
    
	private CustomerManager customerManager = null;
	 
    @Autowired
    public void setCustomerManager(final CustomerManager customerManager) {
        this.customerManager = customerManager;
    }
    
	private DocsgeneralManager docsgeneralManager = null;
	 
    @Autowired
    public void setDocsgeneralManager(final DocsgeneralManager docsgeneralManager) {
        this.docsgeneralManager = docsgeneralManager;
    }
    
    private AccountingTransService accountingTransService;
    @Autowired
    public void setAccountingTransService(final AccountingTransService accountingTransService) {
        this.accountingTransService = accountingTransService;
    }
    
    public AccountingTransportController() {
        setCancelView("redirect:"+URLReference.ACCOUNTING_TRANSPORT_LIST);
        setSuccessView("redirect:"+URLReference.ACCOUNTING_TRANSPORT_LIST);
    }

    @Override
    @InitBinder
    protected void initBinder(final HttpServletRequest request, final ServletRequestDataBinder binder) {
        super.initBinder(request, binder);
        binder.setDisallowedFields("password", "confirmPassword");
    }
    
    @RequestMapping(method = RequestMethod.GET)
    protected ModelAndView showForm(HttpServletRequest request)
    throws Exception {
        ModelAndView mav = new ModelAndView(URLReference.ACCOUNTING_TRANSPORT);
        AccountingTransCondition accountingTransCondition = new AccountingTransCondition();
        
        //load condition
        String customerId = request.getParameter("customerId");
        String month = request.getParameter("month");
        String year = request.getParameter("year");
        accountingTransCondition.setCustomerId(new Long(customerId));
        accountingTransCondition.setMonth(Integer.parseInt(month));
        accountingTransCondition.setYear(Integer.parseInt(year));
        
        
        //Set up command
        List<Docsgeneral> docs = this.docsgeneralManager.findAllByCondition(accountingTransCondition);
        if (docs !=null && !docs.isEmpty()){
        	for (Docsgeneral docsgeneral : docs){
        		this.docsgeneralManager.updateContTruck(docsgeneral);
        	}
        }
        AccountingTrans accountingTrans = new AccountingTrans();
        accountingTrans.setCustomer(customerManager.find(customerId));
        accountingTrans.setCondition(accountingTransCondition);
        accountingTrans.setDocs(docs);
        
        mav.addObject("accountingTrans", accountingTrans);
        mav.addObject("sales", offerpriceManager.findByCustomerAndTypeOfServiceAndIsValid(accountingTrans.getCustomer(), ServicesType.DVVT,true));
        return mav;
    }
 
    @RequestMapping(method = RequestMethod.POST)
    public String onSubmit(AccountingTrans accountingTrans, BindingResult errors, HttpServletRequest request,
                           HttpServletResponse response)
    throws Exception {
        if (request.getParameter("cancel") != null) {
            return getCancelView();
        }
 
        if (validator != null) { // validator is null during testing
            validator.validate(accountingTrans, errors);
 
            if (errors.hasErrors() && request.getParameter("delete") == null) { // don't validate when deleting
                return URLReference.ACCOUNTING_TRANSPORT;
            }
        }
 
        log.debug("entering 'onSubmit' method...");
 
        String success = getSuccessView();
        Locale locale = request.getLocale();
 
        accountingTransService.saveWholePackage(accountingTrans);
        String key = "accountingcus.updated";
        saveMessage(request, getText(key, locale));
        success = "redirect:"+URLReference.ACCOUNTING_TRANSPORT+"?customerId=" + accountingTrans.getCondition().getCustomerId()+
        		"&month="+ accountingTrans.getCondition().getMonth()+
        		"&year="+accountingTrans.getCondition().getYear();
 
        return success;
    }
}

