Deface::Override.new(:virtual_path => 'spree/checkout/_delivery',
                     :name => 'add_cart_item_description_20130000001',
                     :insert_after => 'code[erb-loud]:contains("item.variant.name")',
                     :text => '<%= item %>
                     <% line_item = Spree::Order.find_by_id("12") %>
                     <p><%= line_item.display_total %></p>
                     <p>This is a test message</p>')
