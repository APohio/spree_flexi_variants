Deface::Override.new(:virtual_path => 'spree/checkout/_delivery',
                     :name => 'add_cart_item_description_20130000001',
                     :insert_after => 'code[erb-loud]:contains("item.variant.name")',
                     :text => '<%= item.ad_hoc_option_values %>')
