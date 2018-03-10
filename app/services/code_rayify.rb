class CodeRayify < Redcarpet::Render::HTML
  def block_code(code, language)
    if !language
      language = "ruby"
    end
    CodeRay.scan(code, language).div
  end

  def image(link, title, alt_text)
    if title =~ /=(\d+)x(\d+)/
      %(<img src="#{link}" width="#{$1}" height="#{$2}" alt="#{alt_text}>")
    else
      %(<img src="#{link}" title="#{title}" alt="#{alt_text}">)
    end
  end
end
