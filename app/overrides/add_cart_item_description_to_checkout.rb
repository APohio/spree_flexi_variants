Deface::Override.new(:virtual_path => 'spree/checkout/_delivery',
                     :name => 'add_cart_item_description_20130000001',
                     :replace => '[data-hook="stock-contents"] tbody',
                     :text => '<tbody>
 <% ship_form.object.manifest.each do |item| %>
 		<% @itemimage = mini_image(item.variant) %>
 		<% @itemname = item.variant.name %>
 		<% order_details = Spree::Order.find_by_id(current_order.id) %>
 		
 		<% order_details.line_items.each do |lineitem| %>
 		
 		<% @itemprice = lineitem.price %>
 		
 			 <% lineitem.ad_hoc_option_values.each do |options| %>
                <tr class="stock-item">
                  <td class="item-image"><%= mini_image(item.variant) %></td>
                  <td class="item-name"><%= @itemname %><dt><%= options.option_value.option_type.presentation %></dt><dd><%= options.option_value.presentation %></dd></td>
                  <td class="item-qty"><%= options.quantity %></td>
                  <td class="item-price"><%= @itemprice %></td>
                </tr>
             <% end %>
        <% end %>
 <% end %>
</tbody>')
