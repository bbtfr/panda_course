module ApplicationHelper

  def dash_nobr text
    text.split(" ").map do |word|
      word.include?("-") ? "<nobr>#{word}</nobr>" : word
    end.join(" ").html_safe
  end

  def active? id
    params[:id].split("/")[0] == id.to_s
  end

  def locale? locale
    params[:locale] == locale.to_s
  end

  def english_path options = {}
    url_for(options.merge(locale: :en))
  end

  def chinese_path options = {}
    url_for(options.merge(locale: :"zh-CN"))
  end

  def t key, options = {}
    I18n.t(key, options.reverse_merge(scope: params[:id]))
  end

  def bootstrap_text_field f, attribute, options = {}
    klass = f.object.class
    human_attribute_name = klass.human_attribute_name(attribute)
    ret = <<-EOF
      <div class="form-group #{"has-error" if f.object.errors.any? && f.object.errors[attribute].any?}">
        <label for="registration_#{attribute}" class="col-sm-4 control-label">
          #{human_attribute_name}
        </label>
        <div class="col-sm-8">
          #{f.text_field(attribute, class: "form-control", placeholder: human_attribute_name)}
    EOF
    ret << "#{"<p class=\"help-block\">#{options[:tips]}</p>"}" if options[:tips]
    ret << <<-EOF
        </div>
      </div>
    EOF
    ret.html_safe
  end

  def bootstrap_text_area f, attribute, placeholder = nil, options = {}
    klass = f.object.class
    human_attribute_name = klass.human_attribute_name(attribute)
    ret = <<-EOF
      <div class="form-group #{"has-error" if f.object.errors.any? && f.object.errors[attribute].any?}">
        <label for="registration_#{attribute}" class="col-sm-4 control-label">
          #{human_attribute_name}
        </label>
        <div class="col-sm-8">
          #{f.text_area(attribute, class: "form-control", placeholder: placeholder||human_attribute_name, rows: 4)}
    EOF
    ret << "#{"<p class=\"help-block\">#{options[:tips]}</p>"}" if options[:tips]
    ret << <<-EOF
        </div>
      </div>
    EOF
    ret.html_safe
  end

  def bootstrap_password_field f, attribute, options = {}
    klass = f.object.class
    human_attribute_name = klass.human_attribute_name(attribute)
    ret = <<-EOF
      <div class="form-group">
        <label for="registration_#{attribute}" class="col-sm-4 control-label">
          #{human_attribute_name}
        </label>
        <div class="col-sm-8">
          #{f.password_field(attribute, class: "form-control", placeholder: human_attribute_name)}
        </div>
      </div>
    EOF
    ret.html_safe
  end

  def bootstrap_radio_buttons f, attribute, buttons, options = {}
    klass = f.object.class
    human_attribute_name = klass.human_attribute_name(attribute)
    ret = <<-EOF
      <div class="form-group #{"has-error" if f.object.errors.any? && f.object.errors[attribute].any?}">
        <label for="registration_#{attribute}" class="col-sm-4 control-label">
          #{human_attribute_name}
        </label>
        <div class="col-sm-8 checkbox">
    EOF
    buttons.each do |button|
      ret << <<-EOF
        <label>
          #{f.radio_button(attribute, button)}
          #{klass.human_attribute_name("#{attribute}.#{button}")}
        </label>
      EOF
    end
    ret << "#{"<p class=\"help-block\">#{options[:tips]}</p>"}" if options[:tips]
    ret << <<-EOF
        </div>
      </div>
    EOF
    ret.html_safe
  end

end
