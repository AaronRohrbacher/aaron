class CodeRayify < Redcarpet::Render::HTML
  def block_code(code, language)
    if !language
      language = "ruby"
    end
    CodeRay.scan(code, language).div
  end
end
