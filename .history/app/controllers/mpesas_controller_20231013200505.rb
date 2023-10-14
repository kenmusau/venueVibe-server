class MpesasController < ApplicationController

    # def stkpush
    #     phoneNumber = params[:phoneNumber]
    #     amount = params[:amount]
    #     url = "https://sandbox.safaricom.co.ke/mpesa/stkpush/v1/processrequest"
    #     timestamp = "#{Time.now.strftime "%Y%m%d%H%M%S"}"
    #     business_short_code = ENV["MPESA_SHORTCODE"]
    #     password = Base64.strict_encode64("#{business_short_code}#{ENV["MPESA_PASSKEY"]}#{timestamp}")
    #     payload = {
    #     'BusinessShortCode': business_short_code,
    #     'Password': password,
    #     'Timestamp': timestamp,
    #     'TransactionType': "CustomerPayBillOnline",
    #     'Amount': amount,
    #     'PartyA': phoneNumber,
    #     'PartyB': business_short_code,
    #     'PhoneNumber': phoneNumber,
    #     'CallBackURL': "#{ENV["CALLBACK_URL"]}/callback_url",
    #     'AccountReference': 'Codearn',
    #     'TransactionDesc': "Payment for Codearn premium"
    #     }.to_json

    #     headers = {
    #     Content_type: 'application/json',
    #     Authorization: "Bearer #{get_access_token}"
    #     }

    #     response = RestClient::Request.new({
    #     method: :post,
    #     url: url,
    #     payload: payload,
    #     headers: headers
    #     }).execute do |response, request|
    #     case response.code
    #     when 500
    #     [ :error, JSON.parse(response.to_str) ]
    #     when 400
    #     [ :error, JSON.parse(response.to_str) ]
    #     when 200
    #     [ :success, JSON.parse(response.to_str) ]
    #     else
    #     fail "Invalid response #{response.to_str} received."
    #     end
    #     end
    #     render json: response
    # end
    def stkpush
        phoneNumber = params[:phoneNumber]
        amount = params[:amount]
        url = "https://sandbox.safaricom.co.ke/mpesa/stkpush/v1/processrequest"
        timestamp = "#{Time.now.strftime "%Y%m%d%H%M%S"}"
        business_short_code = ENV["MPESA_SHORTCODE"]
        password = Base64.strict_encode64("#{business_short_code}#{ENV["MPESA_PASSKEY"]}#{timestamp}")
        payload = {
        'BusinessShortCode': business_short_code,
        'Password': password,
        'Timestamp': timestamp,
        'TransactionType': "CustomerPayBillOnline",
        'Amount': amount,
        'PartyA': phoneNumber,
        'PartyB': business_short_code,
        'PhoneNumber': phoneNumber,
        'CallBackURL': "#{ENV["CALLBACK_URL"]}/callback_url",
        'AccountReference': 'Codearn',
        'TransactionDesc': "Payment for Codearn premium"
        }.to_json

        headers = {
        Content_type: 'application/json',
        Authorization: "Bearer #{get_access_token}"
        }

        response = RestClient::Request.new({
        method: :post,
        url: url,
        payload: payload,
        headers: headers
        }).execute do |response, request|
        case response.code
        when 500
        [ :error, JSON.parse(response.to_str) ]
        when 400
        [ :error, JSON.parse(response.to_str) ]
        when 200
        [ :success, JSON.parse(response.to_str) ]
        else
        fail "Invalid response #{response.to_str} received."
        end
        end
        render json: response
    end
end
