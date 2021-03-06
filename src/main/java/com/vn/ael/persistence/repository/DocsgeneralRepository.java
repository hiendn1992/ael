/**
 * 
 */
package com.vn.ael.persistence.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.vn.ael.enums.ServicesType;
import com.vn.ael.persistence.entity.Docsgeneral;

/**
 * @author khoi
 */
public interface DocsgeneralRepository extends GenericRepository<Docsgeneral> {
	
	/**
	 * Find all by doDelivery value
	 * @param doDelivery
	 * @return
	 */
	List<Docsgeneral> findByDoDelivery(Boolean doDelivery);
	
	/**
	 * Find all by doAccounting value
	 * @param doAccounting
	 * @return
	 */
	List<Docsgeneral> findByDoAccounting(Boolean doAccounting);
	
	/**
	 * Find all by doAccounting value
	 * @param doAccounting
	 * @return
	 */
	List<Docsgeneral> findByDoAccountingAndTypeOfDocs(Boolean doAccounting, ServicesType typeOfDocs);
	
	/**
	 * Find all by doAccounting and Inland/Sealand
	 * @param doAccounting
	 * @return
	 */
	@Query("from Docsgeneral d where d.doAccounting = :doAccounting and (d.typeOfDocs = :inland or d.typeOfDocs = :seaType) ")
	List<Docsgeneral> getDoAccountingInlandSealand(@Param(value = "doAccounting")Boolean doAccounting,@Param(value = "inland")ServicesType inland,@Param(value = "seaType")ServicesType seaType);
	
	/**
	 * Find all by doAccounting and Inland/Sealand
	 * @param doAccounting
	 * @return
	 */
	@Query("from Docsgeneral d where d.customer.id=:customerId and d.doAccounting = :doAccounting and (d.typeOfDocs = :inland or d.typeOfDocs = :seaType) "
			+"and MONTH(d.inland.dateDevPack) = :month "
			+"and YEAR(d.inland.dateDevPack) = :year "
			)
	List<Docsgeneral> getDoAccountingInlandSealandAndTime(@Param(value = "doAccounting")Boolean doAccounting,@Param(value = "inland")ServicesType inland,@Param(value = "seaType")ServicesType seaType
			,@Param(value="month") int month, @Param(value="year") int year, @Param(value="customerId")long customerId);
}
