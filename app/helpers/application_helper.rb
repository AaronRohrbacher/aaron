module ApplicationHelper

  # def markdown(text)
  #   options = {
  #     filter_html:     true,
  #     hard_wrap:       true,
  #     link_attributes: { rel: 'nofollow', target: "_blank" },
  #     space_after_headers: true,
  #     fenced_code_blocks: true,
  #     highlight: true
  #   }
  #
  #   extensions = {
  #     autolink:           true,
  #     superscript:        true,
  #     disable_indented_code_blocks: true,
  #     highlight: true
  #   }
  #
  #   renderer = Redcarpet::Render::HTML.new(options)
  #   markdown = Redcarpet::Markdown.new(renderer, extensions)
  #
  #   markdown.render(text).html_safe
  # end

  # def coderay(text)
  #   CodeRay.scan('class Whatupdawg
  #     def dostuff things="stuff"
  #      end', :ruby).div
  # end

  # def coderay(text)
  #   text.gsub(/\<code( lang="(.+?)")?\>(.+?)\<\/code\>/m) do
  #     CodeRay.scan($3, $2).div(:css => :class)
  #   end
  # end

class CodeRayify < Redcarpet::Render::HTML
  def block_code(code, language)
    CodeRay.scan(code, "ruby").div
  end
end

def markdown(text)
  coderayified = CodeRayify.new(:filter_html => true, :hard_wrap => true)
    options = {
      :fenced_code_blocks => true,
      :no_intra_emphasis => true,
      :autolink => true,
      :strikethrough => true,
      :lax_html_blocks => true,
      :superscript => true,
    }
  markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
  markdown_to_html.render(text).html_safe
end


end
