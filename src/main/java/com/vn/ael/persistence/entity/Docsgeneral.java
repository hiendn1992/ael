package com.vn.ael.persistence.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Transient;

import org.appfuse.model.User;
import org.springframework.format.annotation.NumberFormat;

import com.vn.ael.constants.AELConst;
import com.vn.ael.constants.FormatterPattern;
import com.vn.ael.enums.ServicesType;
import com.vn.ael.webapp.formatter.FormatterUtil;


/**
 * The persistent class for the docsgeneral database table.
 * 
 */
@Entity
@NamedQuery(name="Docsgeneral.findAll", query="SELECT d FROM Docsgeneral d")
public class Docsgeneral extends BaseEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private Date docReceiveDate;

	@ManyToOne
	@JoinColumn(name = "customer")
	private Customer customer;

	private String jobNo;

	@ManyToOne
	@JoinColumn(name = "processingStaff")
	private User processingStaff;
	
	@ManyToOne
	@JoinColumn(name="typeOfContainer")
	private Configuration typeOfContainer;
	
	@ManyToOne
	@JoinColumn(name = "shippingLine")
	private Nhathau shippingLine;
	
	@OneToMany(mappedBy="docsgeneral", cascade = CascadeType.ALL)
	private List<Contseal> contseals;
	
	@OneToMany(mappedBy="docsgeneral", cascade = CascadeType.ALL)
	private List<Docservice> docservices;
	
	@OneToMany(mappedBy="docsgeneral", cascade = CascadeType.ALL)
	private List<Inlandsize> inlandsizes;
	
	@OneToMany(mappedBy="docsgeneral", cascade = CascadeType.ALL)
	private List<Multitype> contTypes;
	
	@OneToOne(mappedBy = "docsgeneral")
	private Truckingservice truckingservice;
	
	private String contactDelivery;
	
	private String infoInvoice;
	
	private Integer noOfPkgs;
	
	private Integer cmb;
	
	@NumberFormat(pattern = FormatterPattern.NUMBER_HAS_EXTENSION)
	private BigDecimal weigth;
	
	private String placeEmptyDown;
	
	private String placeEmptyUp;
	
	private String placeDelivery;
	
	private String placeRev;
	
	@Enumerated(EnumType.ORDINAL)
	private ServicesType typeOfDocs;
	
	private String placeRev1;
	
	private String placeDelivery1;
	
	private String portPutCont;
	
	private String placeGetCont;
	
	@OneToOne(mappedBy="docsgeneral", cascade = CascadeType.ALL)
	private Inland inland;
	
	@OneToOne(mappedBy="docsgeneral", cascade = CascadeType.ALL)
	private Exhibition exhibition;
	
	@OneToOne(mappedBy = "docsgeneral", cascade = CascadeType.ALL)
	private Packageinfo packageinfo;
	
	@OneToMany(mappedBy="docsgeneral", cascade = CascadeType.ALL)
	private List<Exfeetable> exfeetables;
	
	private Boolean doAccounting;
	
	private Boolean doDelivery;
	
	public Integer getCmb() {
		return this.cmb;
	}
	
	@Transient
	public String getCmbText(){
		return FormatterUtil.formatInteger(this.cmb)+AELConst.SUFFIX_CMB;
	}

	public void setCmb(Integer cmb) {
		this.cmb = cmb;
	}
	
	public String getContactDelivery() {
		return contactDelivery;
	}

	public void setContactDelivery(String contactDelivery) {
		this.contactDelivery = contactDelivery;
	}
	
	public String getInfoInvoice() {
		return infoInvoice;
	}

	public void setInfoInvoice(String infoInvoice) {
		this.infoInvoice = infoInvoice;
	}

	public Exhibition getExhibition() {
		return exhibition;
	}
	
	public void setExhibition(Exhibition exhibition) {
		this.exhibition = exhibition;
	}

	public Integer getNoOfPkgs() {
		return this.noOfPkgs;
	}

	public void setNoOfPkgs(Integer noOfPkgs) {
		this.noOfPkgs = noOfPkgs;
	}
	
	@Transient
	public String getNoOfPkgsText(){
		return FormatterUtil.formatInteger(this.noOfPkgs)+AELConst.SUFFIX_PKGS;
	}

	public BigDecimal getWeigth() {
		return this.weigth;
	}
	
	@Transient
	public String getWeigthText(){
		return FormatterUtil.formatBigDecimal(this.weigth)+AELConst.SUFFIX_KG;
	}

	public void setWeigth(BigDecimal weigth) {
		this.weigth = weigth;
	}
	
	public Docsgeneral() {
	}

	public Customer getCustomer() {
		return this.customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public String getJobNo() {
		return this.jobNo;
	}

	public void setJobNo(String jobNo) {
		this.jobNo = jobNo;
	}

	public User getProcessingStaff() {
		return this.processingStaff;
	}

	public void setProcessingStaff(User processingStaff) {
		this.processingStaff = processingStaff;
	}

	public Configuration getTypeOfContainer() {
		return this.typeOfContainer;
	}

	public void setTypeOfContainer(Configuration typeOfContainer) {
		this.typeOfContainer = typeOfContainer;
	}

	public String getPlaceEmptyDown() {
		return placeEmptyDown;
	}

	public void setPlaceEmptyDown(String placeEmptyDown) {
		this.placeEmptyDown = placeEmptyDown;
	}

	public String getPlaceEmptyUp() {
		return placeEmptyUp;
	}

	public void setPlaceEmptyUp(String placeEmptyUp) {
		this.placeEmptyUp = placeEmptyUp;
	}

	public String getPlaceDelivery() {
		return placeDelivery;
	}

	public void setPlaceDelivery(String placeDelivery) {
		this.placeDelivery = placeDelivery;
	}

	public String getPlaceRev() {
		return placeRev;
	}

	public void setPlaceRev(String placeRev) {
		this.placeRev = placeRev;
	}
	
	public Date getDocReceiveDate() {
		return this.docReceiveDate;
	}

	public void setDocReceiveDate(Date docReceiveDate) {
		this.docReceiveDate = docReceiveDate;
	}

	public Nhathau getShippingLine() {
		return shippingLine;
	}

	public void setShippingLine(Nhathau shippingLine) {
		this.shippingLine = shippingLine;
	}

	public ServicesType getTypeOfDocs() {
		return typeOfDocs;
	}

	public void setTypeOfDocs(ServicesType typeOfDocs) {
		this.typeOfDocs = typeOfDocs;
	}

	public Inland getInland() {
		return inland;
	}

	public void setInland(Inland inland) {
		this.inland = inland;
	}

	public Packageinfo getPackageinfo() {
		return packageinfo;
	}

	public void setPackageinfo(Packageinfo packageinfo) {
		this.packageinfo = packageinfo;
	}
	
	public List<Contseal> getContseals() {
		return this.contseals;
	}

	public void setContseals(List<Contseal> contseals) {
		this.contseals = contseals;
	}

	public Contseal addContseal(Contseal contseal) {
		getContseals().add(contseal);
		contseal.setDocsgeneral(this);

		return contseal;
	}

	public Contseal removeContseal(Contseal contseal) {
		getContseals().remove(contseal);
		contseal.setDocsgeneral(null);
		return contseal;
	}
	
	public List<Docservice> getDocservices() {
		return docservices;
	}

	public void setDocservices(List<Docservice> docservices) {
		this.docservices = docservices;
	}

	public List<Exfeetable> getExfeetables() {
		return exfeetables;
	}

	public void setExfeetables(List<Exfeetable> exfeetables) {
		this.exfeetables = exfeetables;
	}

	public List<Inlandsize> getInlandsizes() {
		return inlandsizes;
	}

	public void setInlandsizes(List<Inlandsize> inlandsizes) {
		this.inlandsizes = inlandsizes;
	}

	public List<Multitype> getContTypes() {
		return contTypes;
	}

	public void setContTypes(List<Multitype> contTypes) {
		this.contTypes = contTypes;
	}

	public String getPlaceRev1() {
		return placeRev1;
	}

	public void setPlaceRev1(String placeRev1) {
		this.placeRev1 = placeRev1;
	}

	public String getPlaceDelivery1() {
		return placeDelivery1;
	}

	public void setPlaceDelivery1(String placeDelivery1) {
		this.placeDelivery1 = placeDelivery1;
	}

	public Boolean getDoAccounting() {
		return doAccounting;
	}

	public void setDoAccounting(Boolean doAccounting) {
		this.doAccounting = doAccounting;
	}

	public Boolean getDoDelivery() {
		return doDelivery;
	}

	public void setDoDelivery(Boolean doDelivery) {
		this.doDelivery = doDelivery;
	}
	
	public String getPortPutCont() {
		return portPutCont;
	}

	public void setPortPutCont(String portPutCont) {
		this.portPutCont = portPutCont;
	}

	public String getPlaceGetCont() {
		return placeGetCont;
	}

	public void setPlaceGetCont(String placeGetCont) {
		this.placeGetCont = placeGetCont;
	}
	
	@Transient
	public String getPTVT(){
		if (this.packageinfo == null){
			return  this.typeOfContainer.getValue();
		}
		if (this.typeOfContainer == null){
			return this.packageinfo.getTypeOfTransport().getValue();
		}
		return this.packageinfo.getTypeOfTransport().getValue()+"/"+this.typeOfContainer.getValue();
	}
	
	@Transient
	private int noOf20Cont;
	
	@Transient
	private int noOf40Cont;
	
	@Transient
	private boolean isLCL;

	public Integer getNoOf20Cont() {
		return noOf20Cont;
	}

	public void setNoOf20Cont(int noOf20Cont) {
		this.noOf20Cont = noOf20Cont;
	}

	public int getNoOf40Cont() {
		return noOf40Cont;
	}

	public void setNoOf40Cont(int noOf40Cont) {
		this.noOf40Cont = noOf40Cont;
	}

	public boolean getIsLCL() {
		return isLCL;
	}

	public void setIsLCL(boolean isLCL) {
		this.isLCL = isLCL;
	}

	public Truckingservice getTruckingservice() {
		return truckingservice;
	}

	public void setTruckingservice(Truckingservice truckingservice) {
		this.truckingservice = truckingservice;
	}
	
	@Transient
	@NumberFormat(pattern = FormatterPattern.NUMBER_HAS_EXTENSION)
	private BigDecimal chiho;

	public BigDecimal getChiho() {
		return chiho;
	}

	public void setChiho(BigDecimal chiho) {
		this.chiho = chiho;
	}
	
	
}