module ApplicationHelper

  def active? id
    params[:id] == id.to_s
  end

  def locale? locale
    params[:locale] == locale.to_s
  end

  def page_en_path options = {}
    page_path(options.merge(locale: :en))
  end

  def page_cn_path options = {}
    page_path(options.merge(locale: :"zh-CN"))
  end

  def t key, options = {}
    I18n.t(key, options.reverse_merge(
      locale: params[:locale], scope: params[:id]))
  end

end
