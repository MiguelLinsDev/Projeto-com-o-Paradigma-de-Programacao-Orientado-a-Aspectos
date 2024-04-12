public aspect VerificacaoSaldo {
    pointcut tentativasDeSaque(Conta conta, double valor): 
        execution(void Conta+.sacar(double)) && args(valor) && target(conta);

    before(Conta conta, double valor): tentativasDeSaque(conta, valor) {
        if (conta.getSaldo() < valor) {
            System.out.println("Erro: Saldo insuficiente para saque na conta " + conta.getNumeroConta());
            throw new RuntimeException("Saldo insuficiente");
        }
    }
}
