module Spree
  # in populate, params[:customization] contains all the fields supplied by
  # the customization_type_view. Those values are saved in this class
  class CustomizedProductOption < ActiveRecord::Base
    belongs_to :product_customization
    belongs_to :customizable_product_option
    
    attr_accessible :product_customization_id, :customizable_product_option_id, :value

    mount_uploader :customization_image, CustomizationImageUploader

    def empty?
      value.empty? && !customization_image?
    end
  end
end
