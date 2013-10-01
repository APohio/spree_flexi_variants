Deface::Override.new(:virtual_path => 'spree/checkout/_delivery',
                     :name => 'add_cart_item_description_20130000001',
                     :insert_after => 'code[erb-loud]:contains("item.variant.name")',
                     :text => '<%= item %>
                     <% line_item = Spree::Order.find_line_item_by_order_id("18") %>
                     <p><%= line_item.display_total %></p>
                     <p>This is a test message</p>')
