package com.smt.bean;

public class BillBean {

	private Long pkBillId;
	private Long billNo;
	private Long barcodeNo;
	private Double pendingBill;
	private Long fkCustId;
	private Long creditCustBillNo;
	
	public Long getBillNo() {
		return billNo;
	}

	public void setBillNo(Long billNo) {
		this.billNo = billNo;
	}

	public Long getBarcodeNo() {
		return barcodeNo;
	}

	public void setBarcodeNo(Long barcodeNo) {
		this.barcodeNo = barcodeNo;
	}

	public Long getPkBillId() {
		return pkBillId;
	}

	public void setPkBillId(Long pkBillId) {
		this.pkBillId = pkBillId;
	}

	public Double getPendingBill() {
		return pendingBill;
	}

	public void setPendingBill(Double pendingBill) {
		this.pendingBill = pendingBill;
	}

	public Long getFkCustId() {
		return fkCustId;
	}

	public void setFkCustId(Long fkCustId) {
		this.fkCustId = fkCustId;
	}

	public Long getCreditCustBillNo() {
		return creditCustBillNo;
	}

	public void setCreditCustBillNo(Long creditCustBillNo) {
		this.creditCustBillNo = creditCustBillNo;
	}

	
}
