require_relative 'spec_helper'
# require_relative '../Product'


describe FarMar::Product do

  p = FarMar::Product.new(2, "name", 1)

  describe "initialize" do
    it "should be an instance of Product" do
      p.must_be_instance_of(FarMar::Product)
    end
  end

  describe "find " do
    product_find = FarMar::Product.find(1)
    it "returns an instance of the object where the value of the id matches" do
      product_find.must_be_kind_of(FarMar::Product)
    end
    it "should inlcude the values 'Dry Beets' " do
      product_find.name.must_equal "Dry Beets"
    end
  end
  describe "vendor" do
    it "should return instances of Vendor that are associated with the product" do
      p.vendor_info.each do |line|
        p.vendor.line.name.must_equal(FarMar:Vendor.name)
      end
    end
  end
  describe "sales" do
    it "should return a collection of FarMar::Sale instances that are associated
    using the FarMar::Sale product_id  " do
      p.sale_info.each do |line|
        p.sales.line.product_id.must_equal(FarMar.Product.id)
      end
    end
  end

  describe "self.by_vendor" do
    it "should return the products given the vendor information" do
      FarMar::Product.by_vendor(1).each do |line|
        line.vendor_id.must_equal(1)
      end
    end
  end

end

# describe "self.by_vendor(vendor_id)" do
#   it "should returns all of the products with the given vendor_id"
#   FarMar::Product.by_vendor(1)
#







# Each product belongs to a vendor. The vendor_id field refers to the FarMar::Vendor ID field. The FarMar::Product data, in order in the CSV, consists of:
#
# ID - (Fixnum) uniquely identifies the product
# Name - (String) the name of the product (not guaranteed unique)
# Vendor_id - (Fixnum) a reference to which vendor sells this product
