class OauthController < ApplicationController
  def callback
    # binding.pry
    client = OAuth2::Client.new(
                                '-J1fePKFRCDbAUme6FXzjeTgaAbIr0i3f8OV7ao8IPM',
                                'GuADl4cSB3sCfSa1Abha313I1yBswP9UrBIzvrm_6c8',
                                site: 'http://172.30.0.2:3003'
                              )
    client.auth_code.authorize_url(redirect_uri: 'http://localhost:3004/oauth/callback')
    access = client.auth_code.get_token(
                                        params[:code],
                                        redirect_uri: 'http://localhost:3004/oauth/callback'
                                      )
    # binding.pry

  end
end
