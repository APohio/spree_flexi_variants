Deface::Override.new(:virtual_path => 'spree/checkout/_delivery',
                     :name => 'add_cart_item_description_20130000002',
                     :replace => '[data-hook="stock-contents"] tbody',
                     :text => '<tbody>
 <% ship_form.object.manifest.each do |item| %>
 		
 		<% order_details = Spree::Order.find_by_id(current_order.id) %>
 	
 		<% order_details.line_items.each do |lineitem| %>
 			<tr class="stock-item">
                  <td class="item-image"><%= mini_image(item.variant) %></td>
                  <td class="item-name"><%= item.variant.name %>
 			 <% lineitem.ad_hoc_option_values.each do |options| %>
 			 
                <dt><%= options.option_value.option_type.presentation %></dt><dd><%= options.option_value.presentation %></dd>
             <% end %>
                </td>
                <td class="item-qty"><%= lineitem.quantity %></td>
                <td class="item-price"><%= lineitem.price %></td>
                </tr>
        <% end %>
	<% end %>
</tbody>')
