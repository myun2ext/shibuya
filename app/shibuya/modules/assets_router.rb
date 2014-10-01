module Shibuya::AssetsRouter
  def self.included(k)
    k.get '/stylesheets/*' do
      less ('assets/stylesheets/' + params[:splat].first).to_sym
    end
    k.get '/javascripts/*' do
      less ('assets/javascripts/' + params[:splat].first).to_sym
    end
  end
end
