namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      
      mostrar("Apagando  BD...") {%x(./bin/rails db:drop)}
      mostrar("Criando   BD...") {%x(./bin/rails db:create)}
      mostrar("Migrando  BD...") {%x(./bin/rails db:migrate)}
      mostrar("Populando BD...") {%x(./bin/rails db:seed)}
      
    else
      puts "Você não está no modo desenvolvimento"      
    end
  end

  private
  def mostrar(inicio, fim = "Concluído!")
    spinner = TTY::Spinner.new("[:spinner] #{inicio}")
    spinner.auto_spin
    yield
    spinner.success("(#{fim})")
  end
  
end
