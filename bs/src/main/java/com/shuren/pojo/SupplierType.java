package com.shuren.pojo;

public class SupplierType {
    private Integer suppliertypeid;

    private String suppliertypename;

    public Integer getSuppliertypeid() {
        return suppliertypeid;
    }

    public void setSuppliertypeid(Integer suppliertypeid) {
        this.suppliertypeid = suppliertypeid;
    }

    public String getSuppliertypename() {
        return suppliertypename;
    }

    public void setSuppliertypename(String suppliertypename) {
        this.suppliertypename = suppliertypename == null ? null : suppliertypename.trim();
    }
}