class OauthController < ApplicationController
  def callback
    # binding.pry
    host = '172.30.0.2'
    client = OAuth2::Client.new(
                                '-J1fePKFRCDbAUme6FXzjeTgaAbIr0i3f8OV7ao8IPM',
                                'GuADl4cSB3sCfSa1Abha313I1yBswP9UrBIzvrm_6c8',
                                site: "http://#{host}:3003",
                                authorize_url: "http://#{host}:3003/oauth/authorize",
                                token_url: "http://#{host}:3003/oauth/token",
                              )
    # 以下は認証URLが取得できる
    # client.auth_code.authorize_url(redirect_uri: 'http://localhost:3004/oauth/callback')
    access = client.auth_code.get_token(
                                        params[:code],
                                        redirect_uri: 'http://localhost:3004/oauth/callback'
                                      )
    token = access.token
    response = access.get('/api/v1/me', headers: {"Authorization" => "Bearer #{token}"})
    body = JSON.parse(response.body)
    binding.pry

  end
end
