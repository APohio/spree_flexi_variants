Deface::Override.new(:virtual_path => 'spree/admin/orders/_shipment',
                     :name => 'add_admin_orders_shipment-line-items',
                     :replace => 'tr.show-method.total',
                     :text => ' 
                                       
                     <% @order.line_items.each do |item| %>
      <tr data-hook="order_details_line_item_row">
        <td data-hook="order_item_image">
          <% if item.variant.images.length == 0 %>
            <%= link_to small_image(item.variant.product), item.variant.product %>
          <% else %>
            <%= link_to image_tag(item.variant.images.first.attachment.url(:mini)), item.variant.product %>
          <% end %>
        </td>
        <td data-hook="order_item_description">
          <p><%= item.variant.product.name %></p>
         <dl>
  <!-- TODO: group multi-select options (e.g. toppings) -->
  <% item.ad_hoc_option_values.each do |pov| %>
    <dt><%= pov.option_value.option_type.presentation %></dt>
    <dd><%= pov.option_value.presentation %></dd>
  <% end %>

  <% item.product_customizations.each do |customization| %>

    <% next if customization.customized_product_options.all? {|cpo| cpo.empty? } %>

    <dt><%= customization.product_customization_type.presentation %></dt>
    <dd>
          <% customization.customized_product_options.each do |option| %>

            <% next if option.empty? %>

<% partial = option.customizable_product_option.name %>
            <% lookup=ActionView::LookupContext.new(ActionController::Base.view_paths, {:formats => [:html]}) %>

            <% if lookup.exists?("spree/orders/custom_fields/#{partial}",nil,true) %>

              <%= render :partial => "spree/orders/custom_fields/#{partial}", :locals=>{:option => option} %>

            <% else %>

              <% if option.customization_image? %>
                <%= image_tag(option.customization_image.thumb.url) %>
              <% else %>
                <p><%= option.customizable_product_option.presentation %> = <%= option.value %></p>
              <% end %>

            <% end %>
          <% end %> <!-- each option --> 
    </dd>
    <% end %> <!-- each customization -->
</dl>
        </td>
        <td data-hook="order_item_price" class="price"><span><%= item.single_money.to_html %></span></td>
        <td data-hook="order_item_qty"><%= item.quantity %></td>
        <td data-hook="order_item_total" class="total"><span><%= item.display_amount.to_html %></span></td>
      </tr>
    <% end %>

      
                     
                     <tr class="show-method total">
        <td colspan="4">
          <% if shipment.adjustment.present? && shipment.shipping_method.present? %>
            <strong><%= shipment.adjustment.label %>: <%= shipment.shipping_method.name %></strong>
          <% else %>
            <%= Spree.t(:cannot_set_shipping_method_without_address) %>
          <% end %>
        </td>
        <td class="total" align="center">
          <% if shipment.adjustment.present? %>
            <span><%= shipment.adjustment.display_amount %></span>
          <% end %>
        </td>
        <% if shipment.adjustment.present? && !shipment.shipped? %>
          <td class="actions">
            <% if can? :update, shipment %>
              <%= link_to "", "#", :class => "edit-method icon_link icon-edit no-text with-tip", :data => {:action => "edit"}, :title => Spree.t("edit") %>
            <% end %>
          </td>
        <% end %>
      </tr>' )
