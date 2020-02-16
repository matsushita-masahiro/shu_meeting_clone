class ContactMailer < ApplicationMailer
    def send_when_create(inquiry)
      @inquiry = inquiry 
      mail to: inquiry.email, subject: '【テキストア】 お問い合わせありがとうございます'
    end
    
    def send_when_create_admin(inquiry)
      @inquiry = inquiry 
      mail to: "michiru.s2.911@gmail.com", subject: "#{@inquiry.name}さんからお問い合わせ受け付けました"
    end
    
    def send_when_answer(answer)
      @answer = answer 
      @inquiry = Inquiry.find_by(id: @answer.inquiry_id)
      mail to: @inquiry.email, subject: '【テキストア】 お問合せへの回答です'
    end
    
    def send_when_answer_admin(answer)
      @answer = answer 
      @inquiry = Inquiry.find_by(id: @answer.inquiry_id)
      mail to: "michiru.s2.911@gmail.com", subject: "#{@inquiry.name}さんへ回答送信しました"
    end
end


