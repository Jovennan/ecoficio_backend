class DocumentosPdf < Prawn::Document

    PDF_OPTIONS = {
      # Escolhe o Page size como uma folha A4
      :page_size   => "A4",
      # Define o formato do layout como portrait (poderia ser landscape)
      :page_layout => :portrait,
      # Define a margem do documento
      :margin      => [40, 75]
    }
  
    def initialize(documento)
      super(PDF_OPTIONS)
      @documento = documento
      header_doc
      body_doc
      footer_doc
      # super()
  
    end
  
    def header_doc
      # Define a cor do traçado
      fill_color "666666"
      image "#{Rails.root}/public/brasao_pb.png", :at => [0, cursor], :width => 77, :height => 33
      image "#{Rails.root}/public/brasao_fundac.png", :at => [370, cursor], :width => 77, :height => 33, :indent => 20
      # Cria um texto com tamanho 30 PDF Points, bold alinha no centro]
      text "GOVERNO DO ESTADO DA PARAÍBA", :size => 9, :align => :center
      text "#{@documento.orgao.nome.upcase}", :size => 9, :align => :center
  
      # Move 80 PDF points para baixo o cursor
      move_down 20
    end
  
    def body_doc
        # Escreve o texto com o nome do socioeducando
        text "<b>#{@documento.titulo}</b>", :size => 12, :align => :center, :inline_format => true
        # Move mais 30 PDF points para baixo o cursor
        move_down 10
        # Adiciona o nome da mãe e a idade com 12 PDF points, justify e com o formato inline (Observe que o <b></b> funciona para deixar em negrito)
        text "#{@documento.descricao}", :size => 12, :align => :justify, :inline_format => true
        # Muda de font para Helvetica
        move_down 20
    end
  
    def footer_doc
      font "Helvetica"
      # Inclui um texto com um link clicável (usando a tag link) no bottom da folha do lado esquerdo e coloca uma cor especifica nessa parte (usando a tag color)
      text "Gerado por: #{@documento.autor.nome} cpf #{@documento.autor.cpf}", :size => 10, :inline_format => true, :valign => :bottom, :align => :left
      # Inclui em baixo da folha do lado direito a data e o némero da página usando a tag page
      text "Em: #{(Time.now).strftime("%d/%m/%y as %H:%M")} - Página ", :start_count_at => 0, :page_filter => :all, :align => :right, :size => 8
      # Gera no nosso PDF e coloca na pasta public com o nome agreement.pdf
      # render_file("public/educandos.pdf")
    end
  end