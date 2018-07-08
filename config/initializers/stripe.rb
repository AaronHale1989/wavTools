Rails.configuration.stripe = {
    :stripe_publishable_key => "pk_test_TTGqUXCMF8cEQehdmw643QA7",
    :secret_key => "sk_test_eZTNWtbmz4CEr7wTQ4waGPsd"
}
Stripe.api_key = Rails.configuration.stripe[:secret_key]
