Stripe.plan :el_g_subscription do |plan|
  plan.name = 'El Gaucho News'

  plan.amount = 10000

  plan.currency = 'sek'

  plan.interval = 'month'

  plan.interval_count = 1
end