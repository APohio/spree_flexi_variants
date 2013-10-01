Deface::Override.new(:virtual_path => 'spree/checkout/_delivery',
                     :name => 'add_cart_item_description_20130000001',
                     :insert_after => 'code[erb-loud]:contains("item.variant.name")',
                     :text => '<p><%= item %></p><br/>
                     <p><%= item.variant.ad_hoc_option_value %></p>
                     <p>This is a test message</p>')
