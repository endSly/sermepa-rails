# desc "Explaining what the task does"
# task :sermepa do
#   # Task goes here
# end

namespace :sermepa do
  task :test do
    Sermepa.pay_request(pan: '4548812049400004', cvv2: '123')
  end
end