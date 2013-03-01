module TaxonHelper
  
  #get taxons child count
  def taxons_children_count(taxon)
    taxon.children.count
  end

  #get child taxons list with count
  #derived from spree-core/app/helpers/base_helpers.rb
  def taxons_tree_with_count(root_taxon, current_taxon, max_level = 1)
      return '' if max_level < 1 || root_taxon.children.empty?
      content_tag :ul, :class => 'taxons-list' do
        root_taxon.children.map do |taxon|
          css_class = (current_taxon && current_taxon.self_and_ancestors.include?(taxon)) ? 'current' : nil
          content_tag :li, :class => css_class do
           link_to("#{taxon.name}(#{taxons_children_count(taxon)})", seo_url(taxon)) +
           taxons_tree(taxon, current_taxon, max_level - 1)
          end
        end.join("\n").html_safe
      end
    end
end
