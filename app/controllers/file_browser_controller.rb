class FileBrowserController < ApplicationController
  before_filter :set_up_paths, :only => [:tree, :show]
  layout 'application', :except => :tree
  respond_to :html, :js

  def index
  end

  def tree
    @entries = Dir.entries(@full_path).sort
    @entries.delete_if{|f| f =~ /^\./ }
  end

  def show
    file_stat = File.stat(@full_path)
    @file_attributes = {
      :atime => file_stat.atime,
      :basename => File.basename(@full_path),
      :ctime => file_stat.ctime,
      :extension => File.extname(@full_path).sub(/^./, ''),
      :mtime => file_stat.mtime,
      :size => file_stat.size
    }
  end

protected

  def set_up_paths
    @pointer = (params[:dir] || params[:file] || '')
    @full_path = File.join(Rails.application.config.file_browser_starting_folder, @pointer)
    @publicly_accessible, @request_path = publicly_accessible?(@full_path)
    @request_path = @pointer if @publicly_accessible == false
  end

private

  def publicly_accessible?(path)
    is_public = in_public?(path) || in_assets?(path)
    return is_public.is_a?(String), is_public
  end

  def in_public?(path)
    public_folder = File.join(Rails.root, 'public')
    return path.sub(Regexp.new(public_folder), '') if path.include?(public_folder)
    return false
  end

  def in_assets?(path)
    Rails.application.config.assets.paths.each do |asset_path|
      return "#{Rails.application.config.assets.prefix}#{path.sub(Regexp.new(asset_path), '')}" if path.include?(asset_path)
    end
    return false
  end

end