module ApplicationHelper
   def data_hora_br(date)
      date.strftime("%H:%M %d/%m/%Y")
  end
  def ambiente_rails
      if Rails.env.development?
          "Desenvolvimento"
      elsif Rails.env.production?
          "Produção"
      else
          "Teste"
      end
  end
end
