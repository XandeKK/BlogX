class UploadController < ActionController::Base
  skip_before_action :verify_authenticity_token
  FILE_EXT = [".gif", ".jpeg", ".jpg", ".png", ".svg"]
  
  def upload_file
    if params[:file]
      blob = ActiveStorage::Blob.create_and_upload!(
      io: params[:file],
      filename: params[:file].original_filename,
      content_type: params[:file].content_type
    )
    
    render json: {location: url_for(blob)}, content_type:  "text / html"
    else
      render :text => {:link => nil}.to_json
    end
  end
  
  def file_validation(ext)
    raise "Not allowed" unless FILE_EXT.include?(ext)
  end
  
  def access_file
    if File.exists?(Rails.root.join("storage", "files", params[:name]))
      send_data File.read(Rails.root.join("storage", "files", params[:name])), :disposition => "attachment"
    else
      render :nothing => true
    end
  end
end