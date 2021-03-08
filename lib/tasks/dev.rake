namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      
      mostrar("Apagando  BD...") {%x(./bin/rails db:drop)}
      mostrar("Criando   BD...") {%x(./bin/rails db:create)}
      mostrar("Migrando  BD...") {%x(./bin/rails db:migrate)}
      %x(rails dev:add_minerios)
      %x(rails dev:add_moedas)
      
    else
      puts "Você não está no modo desenvolvimento"      
    end
  end


  desc "Cadastra as moedas"
  task add_moedas: :environment do
    mostrar("Cadastrando moedas...") do
      moedas = [
                  { 
                    description: "Bitcoin",
                    acronym: "BTC",
                    url_image: "https://assets.chinatechnews.com/wp-content/uploads/bitcoin-logo.jpg",
                    mineracao: Mineracao.find_by(acronimo: 'PoW')
                  },
                  { 
                    description: "Ethereum",
                    acronym: "ETH",
                    url_image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZCRfwkqpPvFb3QmmwGONG2i6PsgnqZ3L7dRzCNlaSTB1-ruu5",
                    mineracao: Mineracao.all.sample
                  },
                  { 
                    description: "Dash",
                    acronym: "DASH",
                    url_image: "https://ih1.redbubble.net/image.406055498.8711/ap,550x550,12x12,1,transparent,t.png",
                    mineracao: Mineracao.all.sample
                  },
                  { 
                    description: "Iota",
                    acronym: "IOT",
                    url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/1720.png",
                    mineracao: Mineracao.all.sample
                  },
                  { 
                    description: "ZCash",
                    acronym: "ZEC",
                    url_image: "https://www.cryptocompare.com/media/351360/zec.png",
                    mineracao: Mineracao.all.sample
                  }
              ]
      
        moedas.each do |moeda|
          Coin.find_or_create_by!(moeda)
        end
    end
  end

  desc "Cadastra os tipos de mineração"
  task add_minerios: :environment do
    mostrar("Cadastrando tipos de mineração...") do
      tipos = [
        {nome: "Proof of Work", acronimo: "PoW"},
        {nome: "Proof of Stake", acronimo: "PoS"},
        {nome: "Proof of Capacity", acronimo: "PoC"}
      ]
      
      tipos.each do |tipo|
        Mineracao.find_or_create_by!(tipo)
      end
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
