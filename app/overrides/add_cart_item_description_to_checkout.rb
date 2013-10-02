Deface::Override.new(:virtual_path => 'spree/checkout/_delivery',
                     :name => 'add_cart_item_description_20130000001',
                     :insert_after => 'code[erb-loud]:contains("item.variant.name")',
                     :text => '<%= item %>
                     <% order_details = Spree::Order.find_by_id(current_order.id) %>
                     <P><%= order_details.line_item %></p>
                     <p>This is a test message</p>')
