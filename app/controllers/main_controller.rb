class MainController < ApplicationController
  def index
    @pages = Page.all.order created_at: :desc
  end

  def new
    @page = Page.new
  end

  def edit
    @page = Page.find params[:id]
  end

  def delete
    if Page.delete(params[:id])
      flash[:success] = 'Successfully deleted!'
    else
      flash[:danger] = 'Delete failed!'
    end
    redirect_back fallback_location: {action: :index}
  end

  def update
    page = Page.find params[:id]
    create_or_update 'edit', page
    return if performed?
    flash[:success] = 'Successfully updated!'
    redirect_back fallback_location: {action: :index}
  end

  def page
    @page = Page.where(url: params[:url]).take
    render :layout => false
  end

  def create
    page = create_or_update 'new'
    return if performed?

    page.save
    flash[:notice] = 'Page created!'
    redirect_to action: 'index'
  end

  def create_or_update(redirection, page = nil)

    unless deal_with_image(:image_left, page) and
           deal_with_image(:image_right, page) and
           deal_with_image(:image_bottom, page)
      pp 'redirecting ----------'
      redirect_to( controller: 'main', action: redirection, id: params[:id]) and return
    end

    unless page
      if Page.where(url: params[:url]).exists?
        flash[:danger] = 'Url already exists!'
        redirect_to( controller: 'main', action: redirection, id: params[:id]) and return
      end
    end

    if page
      page.update_attributes page_params
    else
      page = Page.new page_params
    end

    unless page.valid?
      flash[:danger] = 'Fill all fields!'
      redirect_to controller: 'main', action: redirection, id: params[:id]
    end

    page
  end

  def page_params
    # i am really sorry for this
    params[:start] = params[:stars]
    a = params.permit!

    a[:free] ||= false

    a = a.except :image_left
    a = a.except :image_right
    a = a.except :image_bottom
    a = a.except :stars
    a = a.except :authenticity_token
    a = a.except :controller
    a = a.except :images_exist
    a.except :action
  end

  def write_file(file)
    return file if file.is_a? String

    name = file.original_filename
    name.gsub! ' ', '_'

    path = File.join('public', 'images', name)
    File.open(path, 'wb') { |f| f.write(file.read) }

    path.dup.sub! 'public', ''
  end

  def deal_with_image(image_type, page = nil)
    # if updating
    if page
      if params[image_type].blank?
        if get_img(page, image_type).blank?
          flash[:danger] = 'Field '+image_type.to_s.capitalize+' is empty!'
          return false
        else
          return true
        end
      else
        params[correct_type(image_type)] = write_file params[image_type]
        true
      end
    else
      params[correct_type(image_type)] = write_file params[image_type]
      true
    end
  end

  def get_img(page, image_type)
    if image_type == :image_left
      return page.img_left
    end
    if image_type == :image_right
      return page.img_right
    end
    if image_type == :image_bottom
      return page.img_bottom
    end
  end

  def correct_type(image_type)
    if image_type == :image_left
      return :img_left
    end
    if image_type == :image_right
      return :img_right
    end
    if image_type == :image_bottom
      return :img_bottom
    end
  end
end