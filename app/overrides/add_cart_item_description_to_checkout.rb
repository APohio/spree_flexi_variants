Deface::Override.new(:virtual_path => 'spree/checkout/_delivery',
                     :name => 'add_cart_item_description_20130000001',
                     :insert_after => 'code[erb-loud]:contains("display_price(item.variant)")',
                     :text => '<%= item %>
                     <% order_details = Spree::Order.find_by_id(current_order.id) %>
                     <% order_details.line_items.each do |lineitem| %>
                     <%= lineitem.price %>
                     <% end %>')
