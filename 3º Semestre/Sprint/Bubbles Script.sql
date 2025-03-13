-- Dropar o database bd_bubbles
DROP DATABASE IF EXISTS bd_bubbles;

-- Criar e usar o banco bd_bubbles
CREATE DATABASE IF NOT EXISTS bd_bubbles;
USE bd_bubbles;

-- Dropar tabelas
DROP TABLE IF EXISTS tb_comment CASCADE;
DROP TABLE IF EXISTS tb_post CASCADE;
DROP TABLE IF EXISTS tb_event CASCADE;
DROP TABLE IF EXISTS tb_bubble CASCADE;
DROP TABLE IF EXISTS tb_user CASCADE;
DROP TABLE IF EXISTS tb_address CASCADE;

-- Criar tabela tb_address
CREATE TABLE IF NOT EXISTS tb_address (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    cep CHAR(8),
    state VARCHAR(60),
    city VARCHAR(60),
    neighborhood VARCHAR(60),
    street VARCHAR(60),
    house_number VARCHAR(10)
);

-- Criar tabela tb_user
CREATE TABLE IF NOT EXISTS tb_user (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255),
    email VARCHAR(255),
    cpf CHAR(11),
    nickname VARCHAR(255) UNIQUE,
    parole VARCHAR(60),
    address_id INT,
    FOREIGN KEY (address_id) REFERENCES tb_address(id)
);

-- Criar tabela tb_bubble
CREATE TABLE IF NOT EXISTS tb_bubble (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    headline VARCHAR(100),
    explanation VARCHAR(500),
    creation_date DATE,
    category VARCHAR(10) CHECK (category IN ('SPORTS', 'MUSIC', 'GAME', 'ART', 'TECHNOLOGY', 'SCIENCE', 'CULINARY', 'READING')),
    creator_id INT,
    FOREIGN KEY (creator_id) REFERENCES tb_user(id)
);

-- Criar tabela tb_event
CREATE TABLE IF NOT EXISTS tb_event (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	event_type VARCHAR(13) NOT NULL,
    title VARCHAR(100),
    moment TIMESTAMP(6),
    duration INT,
    author_id INT,
    FOREIGN KEY (author_id) REFERENCES tb_user(id),
    bubble_id INT,
    FOREIGN KEY (bubble_id) REFERENCES tb_bubble(id),
    public_place BOOLEAN,
    people_capacity INT,
    address_id INT,
    FOREIGN KEY (address_id) REFERENCES tb_address(id),
    platform VARCHAR(100),
    url VARCHAR(300)
);

-- Criar tabela tb_post
CREATE TABLE IF NOT EXISTS tb_post (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    moment TIMESTAMP(6),
    content VARCHAR(650),
    author_id INT,
    FOREIGN KEY (author_id) REFERENCES tb_user(id),
    bubble_id INT,
    FOREIGN KEY (bubble_id) REFERENCES tb_bubble(id)
);

-- Criar tabela tb_comment
CREATE TABLE IF NOT EXISTS tb_comment (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    moment TIMESTAMP(6),
    content VARCHAR(300),
    author_id INT,
    FOREIGN KEY (author_id) REFERENCES tb_user(id),
    post_id INT,
    FOREIGN KEY (post_id) REFERENCES tb_post(id)
);

-- Inserir dados na tabela tb_address
INSERT INTO tb_address (cep, state, city, neighborhood, street, house_number) VALUES
('12345678', 'São Paulo', 'São Paulo', 'Vila Olímpia', 'Avenida Paulista', '123'),
('87654321', 'Rio de Janeiro', 'Rio de Janeiro', 'Copacabana', 'Rua Ipanema', '456'),
('23456789', 'Minas Gerais', 'Belo Horizonte', 'Centro', 'Rua da Bahia', '789'),
('98765432', 'Bahia', 'Salvador', 'Barra', 'Avenida Oceânica', '1011'),
('34567890', 'Pernambuco', 'Recife', 'Boa Viagem', 'Avenida Boa Viagem', '1213'),
('56789012', 'Ceará', 'Fortaleza', 'Meireles', 'Rua Desembargador Leite Albuquerque', '1415'),
('10987654', 'Paraná', 'Curitiba', 'Batel', 'Rua Buenos Aires', '1617'),
('32109876', 'Santa Catarina', 'Florianópolis', 'Centro', 'Rua Felipe Schmidt', '1819'),
('54321098', 'Rio Grande do Sul', 'Porto Alegre', 'Moinhos de Vento', 'Rua Mostardeiro', '2021'),
('76543210', 'Goiás', 'Goiânia', 'Setor Bueno', 'Avenida T-63', '2223'),
('98765432', 'Espírito Santo', 'Vitória', 'Praia do Canto', 'Avenida Rio Branco', '2425'),
('87654321', 'Amazonas', 'Manaus', 'Adrianópolis', 'Rua Recife', '2627'),
('23456789', 'Paraíba', 'João Pessoa', 'Manaíra', 'Avenida Edson Ramalho', '2829'),
('56789012', 'Maranhão', 'São Luís', 'Renascença', 'Avenida Colares Moreira', '3031'),
('32109876', 'Alagoas', 'Maceió', 'Ponta Verde', 'Rua Álvaro Otacílio', '3233'),
('76543210', 'Tocantins', 'Palmas', 'Plano Diretor Sul', 'Quadra 104 Sul', '3435'),
('54321098', 'Acre', 'Rio Branco', 'Bosque', 'Rua Alvorada', '3637'),
('10987654', 'Rondônia', 'Porto Velho', 'Centro', 'Avenida Carlos Gomes', '3839'),
('98765432', 'Amapá', 'Macapá', 'Central', 'Rua Cândido Mendes', '4041'),
('87654321', 'Roraima', 'Boa Vista', 'Centro', 'Avenida Capitão Júlio Bezerra', '4243');

-- Inserir dados na tabela tb_user
INSERT INTO tb_user (username, email, cpf, nickname, parole, address_id) VALUES
('Paulo Alvares', 'paulo@gmail.com', '12345678901', 'P.Alvares', 'paulo123', 1),
('Ruan Rodrigues', 'ruan@gmail.com', '23456789012', 'helloWorldRu', 'ruan123', 2),
('Laviny Silva', 'laviny@gmail.com', '34567890123', 'lavinySilva', 'laviny123', 3),
('Gabriel Martins', 'biel@gmail.com', '45678901234', 'bielSoldierBoy', 'biel123', 4),
('Vinicius Barbosa', 'vinicu@gmail.com', '56789012345', 'VinicuB', 'vini123', 5),
('Leonardo Cardoso', 'leo.cardoso@gmail.com', '67890123456', 'LeoCard', 'leo123', 6),
('Miguel Palanzo', 'miguel.palanzo@gmail.com', '78901234567', 'Migs09', 'migs123', 7),
('Matheus Alcantra', 'matheuzao23@gmail.com', '89012345678', 'OmathAlcantra', 'math123', 8),
('Fernanda Pereira', 'fePereira@gmail.com', '90123456789', 'fePereira', 'fe1234', 9),
('John Lennon', 'john.lennon@gmail.com', '12312312312', 'OJhonnLennon', 'hateBeatles123', 10),
('Paul McCarteney', 'paul.mccarteney@gmail.com', '23423423423', 'PaulMcCartneyOfficial', 'ilovebeatles', 11),
('George Harrinson', 'george.harrinson@gmail.com', '34534534534', 'ElDonGeorge', 'shalon', 12),
('Ringo Starr', 'ringo.starr@gmail.com', '45645645645', 'AllStarr', 'starr123', 13),
('Monteiro Lobatto', 'monteiro.lobatto@gmail.com', '56756756756', 'TeacherMonteiro', 'monteirinho123', 14),
('Braian Silva', 'braian.silva@gmail.com', '67867867867', 'Braian.Silva', 'braian123', 15),
('Ricardo Sanchez', 'ricardo.sanchez@gmail.com', '78978978978', 'Ricardo.Sanchez', 'rickandmorty', 16),
('Mauricio Sanchez', 'mauricio.sanchez@gmail.com', '89089089089', 'Mauricio.Sanchez', 'rickandmorty', 17),
('Dean Winchester', 'dean.win@gmail.com', '90190190190', 'Dean.Winchester', 'ben123', 18),
('Samuel Winchester', 'sammy.win@gmail.com', '12301230123', 'Sammy.Winchester', 'ruby123', 19),
('Franscisco Alves', 'frasis@gmail.com', '23402340234', 'Francis09', 'franchesco', 20);

-- Inserir dados na tabela tb_bubble
INSERT INTO tb_bubble (headline, explanation, creation_date, category, creator_id) VALUES
('Futebol Brasileiro', 'As últimas notícias sobre o futebol brasileiro', '2023-01-01', 'SPORTS', 1),
('Concerto de Jazz', 'Um incrível concerto de jazz acontecendo na cidade', '2023-02-05', 'MUSIC', 2),
('Campeonato de Xadrez', 'Participe do torneio de xadrez da comunidade', '2023-03-10', 'GAME', 3),
('Exposição de Arte Moderna', 'Descubra as obras mais recentes de artistas contemporâneos', '2023-04-15', 'ART', 4),
('Inovações Tecnológicas', 'Conheça as últimas inovações tecnológicas no mercado', '2023-05-20', 'TECHNOLOGY', 5),
('Avanços Científicos', 'Novas descobertas e avanços na ciência moderna', '2023-06-25', 'SCIENCE', 6),
('Workshop de Culinária', 'Aprenda a preparar pratos deliciosos com chefs renomados', '2023-07-30', 'CULINARY', 7),
('Clube do Livro', 'Discussão mensal sobre obras literárias fascinantes', '2023-08-04', 'READING', 8),
('Corrida de Rua', 'Participe da corrida anual pela saúde e bem-estar', '2023-09-09', 'SPORTS', 9),
('Show de Rock Alternativo', 'Apresentação de bandas de rock alternativo na cidade', '2023-10-14', 'MUSIC', 10),
('Torneio de Esportes Eletrônicos', 'Competição de jogos eletrônicos entre os melhores', '2023-11-19', 'GAME', 11),
('Exposição de Pintura Clássica', 'Obras-primas da pintura clássica em exibição', '2023-12-24', 'ART', 12),
('Feira de Tecnologia', 'Explore as últimas tendências tecnológicas na feira anual', '2024-01-29', 'TECHNOLOGY', 13),
('Conferência Científica', 'Participe das discussões na conferência científica regional', '2024-02-03', 'SCIENCE', 14),
('Curso de Culinária Italiana', 'Aprenda a cozinhar pratos autênticos da culinária italiana', '2024-03-09', 'CULINARY', 15),
('Clube de Leitura de Poesia', 'Explore a poesia em um clube de leitura dedicado', '2024-04-14', 'READING', 16);

-- Inserir dados na tabela tb_event
INSERT INTO tb_event (event_type, title, moment, duration, author_id, bubble_id, public_place, people_capacity, address_id, platform, url) VALUES
('EventInPerson', 'Futebol Brasileiro', '2023-01-15 18:00:00', 120, 1, 1, TRUE, 100, 1, NULL, NULL),
('EventInPerson', 'Concerto de Jazz na Cidade', '2023-02-20 20:00:00', 180, 2, 2, TRUE, 150, 2, NULL, NULL),
('EventInPerson', 'Campeonato de Xadrez na Comunidade', '2023-03-25 14:00:00', 90, 3, 3, TRUE, 50, 3, NULL, NULL),
('EventInPerson', 'Exposição de Arte Moderna', '2023-04-30 15:30:00', 120, 4, 4, TRUE, 80, 4, NULL, NULL),
('EventInPerson', 'Inovações Tecnológicas - Feira', '2023-06-04 10:00:00', 240, 5, 5, TRUE, 120, 5, NULL, NULL),
('EventInPerson', 'Avanços Científicos - Conferência', '2023-07-09 09:30:00', 180, 6, 6, TRUE, 200, 6, NULL, NULL),
('EventInPerson', 'Workshop de Culinária com Chefs Renomados', '2023-08-14 17:00:00', 150, 7, 7, TRUE, 80, 7, NULL, NULL),
('EventInPerson', 'Clube do Livro', '2023-09-19 19:30:00', 120, 8, 8, TRUE, 40, 8, NULL, NULL),
('EventInPerson', 'Corrida de Rua pela Saúde', '2023-10-24 08:00:00', 180, 9, 9, TRUE, 300, 9, NULL, NULL),
('EventInPerson', 'Show de Rock Alternativo na Cidade', '2023-11-28 21:00:00', 210, 10, 10, TRUE, 200, 10, NULL, NULL),
('EventInPerson', 'Torneio de Esportes Eletrônicos ao Vivo', '2024-01-02 16:00:00', 120, 11, 11, TRUE, 50, 11, NULL, NULL),
('EventInPerson', 'Exposição de Pintura Clássica', '2024-02-06 14:30:00', 150, 12, 12, TRUE, 100, 12, NULL, NULL),
('EventInPerson', 'Feira de Tecnologia', '2024-03-12 10:00:00', 240, 13, 13, TRUE, 150, 13, NULL, NULL),
('EventInPerson', 'Conferência Científica Regional ao Vivo', '2024-04-17 09:00:00', 180, 14, 14, TRUE, 200, 14, NULL, NULL),
('EventInPerson', 'Curso de Culinária Italiana', '2024-05-22 16:30:00', 120, 15, 15, TRUE, 80, 15, NULL, NULL),
('EventInPerson', 'Clube de Leitura de Poesia', '2024-06-26 20:00:00', 150, 16, 16, TRUE, 40, 16, NULL, NULL),
('EventOnline', 'Futebol Brasileiro', '2023-01-15 18:00:00', 120, 17, 1, FALSE, NULL, NULL, 'YouTube', 'https://www.youtube.com/futebol-live'),
('EventOnline', 'Concerto de Jazz Online', '2023-02-20 20:00:00', 180, 18, 2, FALSE, NULL, NULL, 'Zoom', 'https://zoom.us/concerto-jazz'),
('EventOnline', 'Campeonato de Xadrez Online', '2023-03-25 14:00:00', 90, 19, 3, FALSE, NULL, NULL, 'Chess.com', 'https://www.chess.com/torneio-xadrez-online'),
('EventOnline', 'Exposição de Arte Moderna', '2023-04-30 15:30:00', 120, 20, 4, FALSE, NULL, NULL, 'ArtOnline', 'https://www.artonline.com/exposicao-moderna'),
('EventOnline', 'Inovações Tecnológicas', '2023-06-04 10:00:00', 240, 1, 5, FALSE, NULL, NULL, 'TechExpo', 'https://www.techexpo.com.br'),
('EventOnline', 'Avanços Científicos', '2023-07-09 09:30:00', 180, 2, 6, FALSE, NULL, NULL, 'SciCon', 'https://www.sciconference.com'),
('EventOnline', 'Workshop de Culinária Online', '2023-08-14 17:00:00', 150, 3, 7, FALSE, NULL, NULL, 'ZoomCulinary', 'https://zoom.us/workshop-culinaria'),
('EventOnline', 'Clube do Livro', '2023-09-19 19:30:00', 120, 4, 8, FALSE, NULL, NULL, 'BookClubOnline', 'https://www.bookclubonline.com'),
('EventOnline', 'Corrida de Rua Virtual', '2023-10-24 08:00:00', 180, 5, 9, FALSE, NULL, NULL, 'Strava', 'https://www.strava.com/corrida-virtual'),
('EventOnline', 'Show de Rock Alternativo ao Vivo', '2023-11-28 21:00:00', 210, 6, 10, FALSE, NULL, NULL, 'YouTubeRock', 'https://www.youtube.com/rock-live'),
('EventOnline', 'Torneio de Esportes Eletrônicos', '2024-01-02 16:00:00', 120, 7, 11, FALSE, NULL, NULL, 'TwitchGaming', 'https://www.twitch.tv/torneio-esportes-eletronicos'),
('EventOnline', 'Exposição de Pintura Clássica', '2024-02-06 14:30:00', 150, 8, 12, FALSE, NULL, NULL, 'ArtOnline', 'https://www.artonline.com/exposicao-classica-online'),
('EventOnline', 'Feira de Tecnologia', '2024-03-12 10:00:00', 240, 9, 13, FALSE, NULL, NULL, 'TechExpo', 'https://www.techexpo.com.br/online'),
('EventOnline', 'Conferência Científica Regional ao Vivo', '2024-04-17 09:00:00', 180, 10, 14, FALSE, NULL, NULL, 'SciCon', 'https://www.sciconference.com/live'),
('EventOnline', 'Curso de Culinária Italiana', '2024-05-22 16:30:00', 120, 11, 15, FALSE, NULL, NULL, 'ZoomCulinary', 'https://zoom.us/curso-culinaria-online'),
('EventOnline', 'Clube de Leitura de Poesia', '2024-06-26 20:00:00', 150, 12, 16, FALSE, NULL, NULL, 'BookClubOnline', 'https://www.bookclubonline.com/leitura-poesia-online');

-- Inserir dados tabela tb_post
INSERT INTO tb_post (moment, content, author_id, bubble_id) VALUES
('2023-01-15 18:30:00', 'Que tal assistir juntos ao próximo jogo do campeonato brasileiro? Vamos torcer pelo nosso time!', 1, 1),
('2023-09-09 09:30:00', 'Estou treinando para a corrida de rua! Quem mais vai participar? Vamos nos preparar juntos!', 9, 9),
('2024-06-26 21:15:00', 'Marque na agenda! Vamos compartilhar dicas de treino para a maratona aquática que está chegando!', 2, 1),
('2023-02-20 21:30:00', 'O concerto de jazz foi incrível! Que músicos talentosos! Compartilhem suas experiências!', 2, 2),
('2023-10-14 22:45:00', 'O show de rock alternativo foi sensacional! Quais foram as suas bandas favoritas? Vamos discutir!', 10, 10),
('2025-02-02 21:00:00', 'Vamos criar uma playlist colaborativa para o festival de jazz latino online! Sugiram suas músicas favoritas!', 6, 2),
('2023-03-10 15:15:00', 'Participei do campeonato de xadrez e consegui um empate emocionante! Alguém mais jogou?', 3, 3),
('2023-11-19 17:45:00', 'Tive uma jogada incrível no torneio de esportes eletrônicos! Vamos compartilhar nossos momentos épicos!', 11, 11),
('2024-07-29 18:30:00', 'Qual é o seu jogo de estratégia favorito? Vamos discutir estratégias e compartilhar dicas!', 19, 3),
('2023-04-15 16:00:00', 'A exposição de arte moderna foi inspiradora! Qual obra mais chamou sua atenção? Compartilhe suas impressões!', 4, 4),
('2024-02-06 15:00:00', 'Encante-se com as obras clássicas da exposição de pintura! Qual é a sua pintura favorita? Vamos debater!', 12, 12),
('2024-04-14 17:45:00', 'Convido todos a compartilharem suas obras de arte favoritas. Vamos explorar a diversidade artística!', 18, 4),
('2023-05-20 11:30:00', 'A feira de inovação tecnológica foi incrível! Quais foram as inovações mais impressionantes? Comentem abaixo!', 5, 5),
('2024-01-29 12:45:00', 'Participei da feira de tecnologia online. Quais gadgets vocês acharam mais interessantes? Vamos discutir!', 13, 13),
('2025-05-19 14:30:00', 'Compartilhem as últimas notícias e discussões sobre inovação tecnológica. Vamos ficar atualizados!', 19, 5),
('2023-06-25 10:00:00', 'A conferência científica foi enriquecedora! Quais palestras vocês acharam mais fascinantes? Comentem suas impressões!', 6, 6),
('2024-04-17 10:45:00', 'Participem da discussão pós-conferência científica. Vamos compartilhar insights e ideias!', 14, 14),
('2025-06-24 11:30:00', 'Estou ansioso para o simposium científico! Vamos discutir as últimas pesquisas e descobertas!', 10, 14),
('2023-07-30 18:15:00', 'O workshop de culinária foi delicioso! Compartilhem as receitas que aprenderam. Vamos trocar dicas!', 7, 7),
('2024-03-09 19:30:00', 'Aula de culinária italiana incrível! Qual prato vocês mais gostaram de aprender a fazer? Comentem!', 15, 15),
('2024-11-18 20:45:00', 'Quem mais está animado para o curso de culinária mexicana? Vamos compartilhar nossas expectativas!', 13, 7),
('2023-08-04 21:00:00', 'Ótimo encontro no clube do livro! Qual livro você sugeriria para a próxima leitura? Deixe suas recomendações!', 8, 8),
('2024-04-14 22:15:00', 'Estou ansioso para o clube de leitura de ficção científica. Quais são os seus livros favoritos do gênero? Compartilhe!', 4, 16),
('2024-12-23 23:30:00', 'Vamos compartilhar nossas experiências literárias de 2024! Quais foram os melhores livros que você leu neste ano?', 16, 16);

-- Inserir dados na tabela tb_comment
INSERT INTO tb_comment (moment, content, author_id, post_id) VALUES
('2023-01-16 09:00:00', 'Mal posso esperar para assistir ao jogo! Quem é o seu time favorito?', 17, 1),
('2023-01-16 15:30:00', 'Vamos organizar um encontro para assistir juntos? Seria incrível!', 2, 1),
('2023-09-10 10:15:00', 'Estou animado para participar da corrida! Alguém mais treinando por aqui?', 18, 2),
('2023-09-10 14:45:00', 'Podíamos combinar um treino em grupo. O que acham?', 3, 2),
('2024-06-27 08:30:00', 'Valeu pela dica! Preciso me preparar bem para a maratona aquática.', 19, 3),
('2024-06-27 12:45:00', 'Vamos compartilhar nossas estratégias de treino para natação. Alguma sugestão?', 4, 3),
('2023-02-21 10:00:00', 'Adorei a música do saxofonista! Quem mais curtiu?', 20, 4),
('2023-02-21 14:30:00', 'Podíamos organizar um grupo para ir a mais concertos de jazz. Topam?', 5, 4),
('2023-10-15 09:30:00', 'A banda de abertura foi incrível! Alguém conhecia?', 1, 5),
('2023-10-15 13:45:00', 'Melhor show de rock que já fui! Quais foram os destaques para vocês?', 6, 5),
('2025-02-03 08:00:00', 'Adicionando minhas músicas favoritas! Vamos fazer uma playlist incrível.', 2, 6),
('2025-02-03 12:15:00', 'Que ideia genial! Compartilhem suas sugestões de músicas latinas imperdíveis.', 7, 6),
('2023-03-11 11:00:00', 'Eu também participei! Foi uma competição acirrada. Como foi para você?', 3, 7),
('2023-03-11 15:30:00', 'Quero melhorar minha abertura no xadrez. Alguém tem dicas?', 8, 7),
('2023-11-20 10:45:00', 'Aquela jogada foi épica! Alguém gravou? Quero rever!', 4, 8),
('2023-11-20 14:00:00', 'Vamos formar uma equipe para o próximo torneio? Quem topa?', 9, 8),
('2024-07-30 11:15:00', 'Adoro jogos de estratégia! Qual é o seu favorito? Vamos compartilhar experiências.', 5, 9),
('2024-07-30 15:30:00', 'Estou viciado em um novo jogo. Quem mais está jogando?', 10, 9),
('2023-04-16 12:30:00', 'A obra abstrata me intrigou! Alguém entendeu o significado?', 6, 10),
('2023-04-16 16:45:00', 'Vamos organizar uma visita guiada à exposição? Quem se anima?', 11, 10),
('2024-02-07 09:00:00', 'A pintura renascentista é fascinante! Alguém mais aprecia esse estilo?', 7, 11),
('2024-02-07 13:15:00', 'Compartilhem suas interpretações das obras clássicas. Vamos discutir arte!', 12, 11),
('2024-04-15 14:45:00', 'Essa escultura contemporânea é incrível! Alguém mais curte arte moderna?', 8, 12),
('2024-04-15 19:00:00', 'Vamos criar uma galeria virtual com nossas obras de arte favoritas. Quem participa?', 13, 12),
('2023-05-21 13:00:00', 'O drone autônomo foi o destaque para mim! Alguém mais se impressionou?', 9, 13),
('2023-05-21 17:15:00', 'Podíamos organizar uma sessão de demonstração dos gadgets. Quem gostaria de participar?', 14, 13),
('2024-01-30 09:30:00', 'A realidade aumentada na feira online foi sensacional! Alguém experimentou?', 10, 14),
('2024-01-30 13:45:00', 'Estou pensando em comprar um dos gadgets apresentados. Alguém tem recomendações?', 15, 14),
('2025-05-20 15:00:00', 'Essa nova tecnologia é promissora! Como vocês acham que vai impactar nossa vida?', 11, 15),
('2025-05-20 19:15:00', 'Vamos debater sobre ética na inovação tecnológica. Quais são suas preocupações?', 16, 15),
('2023-06-26 11:30:00', 'A palestra sobre astrofísica foi incrível! Alguém mais se interessou por esse tópico?', 12, 16),
('2023-06-26 15:45:00', 'Vamos organizar um grupo para participar da próxima conferência? Quem topa?', 17, 16),
('2024-04-18 10:00:00', 'A discussão sobre biotecnologia foi esclarecedora! Alguém mais está estudando na área?', 13, 17),
('2024-04-18 14:15:00', 'Quais foram os pontos mais interessantes da discussão? Vamos compartilhar nossas impressões!', 18, 17),
('2025-06-25 09:45:00', 'Estou ansioso para as apresentações de física quântica! Alguém mais se interessa pelo tema?', 14, 18),
('2025-06-25 14:00:00', 'Vamos criar um grupo de estudo para discutir as apresentações do simposium. Quem está dentro?', 19, 18),
('2023-07-31 12:00:00', 'A receita de massas foi um sucesso! Quem mais tentou em casa?', 15, 19),
('2023-07-31 16:15:00', 'Quais outros tipos de culinária vocês gostariam de aprender em futuros workshops?', 20, 19),
('2024-03-10 11:30:00', 'A lasanha estava divina! Vamos compartilhar outras receitas italianas?', 16, 20),
('2024-03-10 15:45:00', 'Estou ansioso para o próximo curso de culinária. Alguma sugestão de tema?', 1, 20),
('2024-11-19 12:45:00', 'Amo comida mexicana! Quais pratos vocês mais gostam?', 17, 21),
('2024-11-19 17:00:00', 'Vamos compartilhar receitas e dicas sobre culinária mexicana. Quem está nessa?', 2, 21),
('2023-08-05 10:15:00', 'O livro deste mês foi emocionante! Quais são as sugestões para o próximo?', 18, 22),
('2023-08-05 14:30:00', 'Vamos organizar um encontro para discutir os últimos capítulos. Quem topa?', 3, 22),
('2024-04-15 09:45:00', 'Amo ficção científica! Quais são os livros mais intrigantes do gênero?', 19, 23),
('2024-04-15 14:00:00', 'Vamos criar uma lista de leitura para explorar os melhores títulos de ficção científica!', 4, 23),
('2024-12-24 11:30:00', 'Li tantos livros incríveis este ano! Quais foram os destaques para vocês?', 20, 24),
('2024-12-24 15:45:00', 'Vamos trocar recomendações de livros para o próximo ano. Quem está animado?', 5, 24);