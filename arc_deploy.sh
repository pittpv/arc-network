#!/bin/bash

# Цвета для форматирования
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Основная директория проекта
PROJECT_DIR="hello-arc"

# Лог файл в корневой директории
LOG_FILE="arc_deployment.log"

# Функция для перевода (упрощенная реализация)
t() {
    local key="$1"
    if [ "$LANG" = "ru_RU.UTF-8" ]; then
        case "$key" in
            "welcome") echo "Добро пожаловать в установщик Foundry и развертывания контракта на Arc Testnet!" ;;
            "menu_title") echo "=== Меню ===" ;;
            "menu_option1") echo "1) Запустить деплой контракта" ;;
            "menu_option2") echo "2) Просмотреть лог файл" ;;
            "menu_option3") echo "3) Удалить папку проекта" ;;
            "menu_option4") echo "4) Выход" ;;
            "menu_prompt") echo "Выберите опцию:" ;;
            "deploy_started") echo "Запуск процесса деплоя..." ;;
            "view_log") echo "Просмотр лог файла..." ;;
            "delete_project") echo "Удаление проекта..." ;;
            "project_deleted") echo "Папка проекта удалена" ;;
            "project_not_found") echo "Папка проекта не найдена" ;;
            "log_not_found") echo "Лог файл не найден" ;;
			"log_not_deleted") echo "лог файл удален" ;;
            "goodbye") echo "До свидания!" ;;
            "lang_prompt") echo "Выберите язык / Choose language:" ;;
            "lang_option1") echo "1) Русский" ;;
            "lang_option2") echo "2) English" ;;
            "invalid_choice") echo "Неверный выбор. Пожалуйста, выберите 1 или 2" ;;
            "checking_foundry") echo "Проверка наличия Foundry..." ;;
            "foundry_not_found") echo "Foundry не найден. Установка..." ;;
            "downloading_foundry") echo "Скачивание установщика Foundry..." ;;
            "installing_foundry") echo "Установка Foundry..." ;;
            "updating_shell") echo "Обновление shell конфигурации..." ;;
            "foundry_installed") echo "Foundry успешно установлен!" ;;
            "init_project") echo "Инициализация нового Solidity проекта..." ;;
            "creating_env") echo "Создание .env файла..." ;;
            "deleting_counter") echo "Удаление шаблонного файла Counter.sol..." ;;
            "deleting_counter_test") echo "Удаление тестового файла Counter.t.sol..." ;;
            "creating_contract") echo "Создание контракта HelloArchitect.sol..." ;;
            "deleting_scripts") echo "Удаление директории script..." ;;
            "creating_tests") echo "Создание тестов..." ;;
            "running_tests") echo "Запуск тестов..." ;;
            "compiling_contract") echo "Компиляция контракта..." ;;
            "generating_wallet") echo "Генерация кошелька..." ;;
            "wallet_prompt") echo "Введите приватный ключ, сгенерированный выше (начиная с 0x):" ;;
            "address_prompt") echo "Введите адрес кошелька, сгенерированный выше (начиная с 0x):" ;;
            "add_to_env") echo "Добавление адреса и приватного ключа в .env файл..." ;;
            "reload_env") echo "Перезагрузка переменных окружения..." ;;
            "faucet_prompt") echo "Посетите https://faucet.circle.com, выберите Arc Testnet, вставьте адрес вашего кошелька и запросите testnet USDC. Получили ли вы тестовые токены? (Y/N)" ;;
            "deploying_contract") echo "Развертывание контракта..." ;;
            "contract_address_prompt") echo "Введите адрес развернутого контракта (Deployed to):" ;;
            "txhash_prompt") echo "Введите хэш транзакции (Transaction hash):" ;;
            "add_contract_to_env") echo "Добавление адреса контракта в .env файл..." ;;
            "explorer_prompt") echo "Откройте Arc Testnet Explorer https://testnet.arcscan.app и вставьте хэш транзакции из вывода развертывания. Подтвердите, что контракт был успешно развернут? (Y/N)" ;;
            "calling_function") echo "Вызов функции контракта..." ;;
            "success") echo "Поздравляем! Вы развернули и взаимодействовали с вашим первым контрактом на Arc Testnet." ;;
            "next_steps") echo "Дальнейшие шаги:" ;;
            "step1") echo "Расширьте контракт HelloArchitect дополнительной логикой" ;;
            "step2") echo "Исследуйте возможности Arc с нативными стейблкоинами" ;;
            "step3") echo "Создавайте более сложные приложения для платежей, FX или токенизированных активов" ;;
            "error") echo "Ошибка: операция прервана" ;;
            "auto_env") echo "Автоматическое добавление переменных в .env файл..." ;;
            "extracting_wallet_info") echo "Извлечение информации о кошельке..." ;;
            "extracting_deployment_info") echo "Извлечение информации о развертывании..." ;;
            "wallet_selection") echo "Выберите опцию кошелька:" ;;
            "wallet_option1") echo "1) Создать новый кошелек" ;;
            "wallet_option2") echo "2) Импортировать существующий кошелек с приватным ключом" ;;
            "import_wallet") echo "Импорт существующего кошелька..." ;;
            "enter_private_key") echo "Введите ваш приватный ключ (начиная с 0x):" ;;
            "invalid_private_key") echo "Неверный формат приватного ключа. Должен содержать 64 hex-символа, начиная с 0x" ;;
            "extracting_address") echo "Извлечение адреса кошелька из приватного ключа..." ;;
            "wallet_imported") echo "Кошелек успешно импортирован в cast" ;;
            "wallet_import_optional") echo "Примечание: Кошелек не импортирован в cast (это опционально)" ;;
            *) echo "$key" ;;
        esac
    else
        case "$key" in
            "welcome") echo "Welcome to the Foundry installer and contract deployment on Arc Testnet!" ;;
            "menu_title") echo "=== Menu ===" ;;
            "menu_option1") echo "1) Start contract deployment" ;;
            "menu_option2") echo "2) View log file" ;;
            "menu_option3") echo "3) Delete project folder" ;;
            "menu_option4") echo "4) Exit" ;;
            "menu_prompt") echo "Choose an option:" ;;
            "deploy_started") echo "Starting deployment process..." ;;
            "view_log") echo "Viewing log file..." ;;
            "delete_project") echo "Deleting project..." ;;
            "project_deleted") echo "Project folder deleted" ;;
            "project_not_found") echo "Project folder not found" ;;
            "log_not_found") echo "Log file not found" ;;
			"log_not_deleted") echo "Log file deleted" ;;
            "goodbye") echo "Goodbye!" ;;
            "lang_prompt") echo "Choose language:" ;;
            "lang_option1") echo "1) Russian" ;;
            "lang_option2") echo "2) English" ;;
            "invalid_choice") echo "Invalid choice. Please choose 1 or 2" ;;
            "checking_foundry") echo "Checking for Foundry..." ;;
            "foundry_not_found") echo "Foundry not found. Installing..." ;;
            "downloading_foundry") echo "Downloading Foundry installer..." ;;
            "installing_foundry") echo "Installing Foundry..." ;;
            "updating_shell") echo "Updating shell configuration..." ;;
            "foundry_installed") echo "Foundry successfully installed!" ;;
            "init_project") echo "Initializing new Solidity project..." ;;
            "creating_env") echo "Creating .env file..." ;;
            "deleting_counter") echo "Deleting template Counter.sol file..." ;;
            "deleting_counter_test") echo "Deleting Counter.t.sol test file..." ;;
            "creating_contract") echo "Creating HelloArchitect.sol contract..." ;;
            "deleting_scripts") echo "Deleting script directory..." ;;
            "creating_tests") echo "Creating tests..." ;;
            "running_tests") echo "Running tests..." ;;
            "compiling_contract") echo "Compiling contract..." ;;
            "generating_wallet") echo "Generating wallet..." ;;
            "wallet_prompt") echo "Enter the private key generated above (starting with 0x):" ;;
            "address_prompt") echo "Enter the wallet address generated above (starting with 0x):" ;;
            "add_to_env") echo "Adding address and private key to .env file..." ;;
            "reload_env") echo "Reloading environment variables..." ;;
            "faucet_prompt") echo "Visit https://faucet.circle.com, select Arc Testnet, paste your wallet address, and request testnet USDC. Did you received testnet tokens? (Y/N)" ;;
            "deploying_contract") echo "Deploying contract..." ;;
            "contract_address_prompt") echo "Enter the deployed contract address (Deployed to):" ;;
            "txhash_prompt") echo "Enter the transaction hash (Transaction hash):" ;;
            "add_contract_to_env") echo "Adding contract address to .env file..." ;;
            "explorer_prompt") echo "Open the Arc Testnet Explorer https://testnet.arcscan.app and paste the transaction hash from the deployment output. Confirm that the contract was deployed successfully? (Y/N)" ;;
            "calling_function") echo "Calling contract function..." ;;
            "success") echo "Congratulations! You've deployed and interacted with your first contract on Arc Testnet." ;;
            "next_steps") echo "From here, you can:" ;;
            "step1") echo "Extend the HelloArchitect contract with more logic" ;;
            "step2") echo "Explore Arc's stablecoin-native features like USDC as gas" ;;
            "step3") echo "Build more advanced applications for payments, FX, or tokenized assets" ;;
            "error") echo "Error: operation aborted" ;;
            "auto_env") echo "Automatically adding variables to .env file..." ;;
            "extracting_wallet_info") echo "Extracting wallet information..." ;;
            "extracting_deployment_info") echo "Extracting deployment information..." ;;
            "wallet_selection") echo "Choose wallet option:" ;;
            "wallet_option1") echo "1) Create new wallet" ;;
            "wallet_option2") echo "2) Import existing wallet with private key" ;;
            "import_wallet") echo "Importing existing wallet..." ;;
            "enter_private_key") echo "Enter your private key (starting with 0x):" ;;
            "invalid_private_key") echo "Invalid private key format. Should be 64 hex characters starting with 0x" ;;
            "extracting_address") echo "Extracting wallet address from private key..." ;;
            "wallet_imported") echo "Wallet imported to cast successfully" ;;
            "wallet_import_optional") echo "Note: Wallet not imported to cast (this is optional)" ;;
            *) echo "$key" ;;
        esac
    fi
}

# Функция отображения лого
show_logo() {
    echo -e " "
    echo -e "${BLUE}$(t "welcome")${NC}"
    echo -e "${NC}"
echo "      ___           ___           ___     "
echo "     /  /\\         /  /\\         /  /\\    "
echo "    /  /::\\       /  /::\\       /  /:/    "
echo "   /  /:/\\:\\     /  /:/\\:\\     /  /:/     "
echo "  /  /:/~/::\\   /  /:/~/:/    /  /:/  ___ "
echo " /__/:/ /:/\\:\\ /__/:/ /:/___ /__/:/  /  /\\"
echo " \\  \\:\\/:/\\_\/ \\  \\:\\/:::::/ \\  \\:\\ /  /:/"
echo "  \\  \\::/       \\  \\::/~~~~   \\  \\:\\  /:/ "
echo "   \\  \\:\\        \\  \\:\\        \\  \\:\\/:/  "
echo "    \\  \\:\\        \\  \\:\\        \\  \\::/   "
echo "     \\__\\/         \\__\\/         \\__\\/     "

    echo -e "${NC}"
    echo -e "${YELLOW}Arc Testnet Deployment Script${NC}"
    echo -e "${NC}Automated Smart Contract Deployment${NC}"
    echo -e " "

	info_lines=(
	  " Maintained by Pittpv"
	  " Feedback & Support: https://t.me/+DLsyG6ol3SFjM2Vk"
	  " Donate"
	  "  EVM: 0x4FD5eC033BA33507E2dbFE57ca3ce0A6D70b48Bf"
	  "  SOL: C9TV7Q4N77LrKJx4njpdttxmgpJ9HGFmQAn7GyDebH4R"
	)

	# --- Подсчёт длины строк для рамки ---
	max_len=0
	for line in "${info_lines[@]}"; do
	  clean_line=$(echo "$line" | sed -E 's/\x1B\[[0-9;]*[mK]//g')
	  line_length=$(echo -n "$clean_line" | wc -m)
	  (( line_length > max_len )) && max_len=$line_length
	done

	# --- Рамки ---
	top_border="╔$(printf '═%.0s' $(seq 1 $((max_len + 2))))╗"
	bottom_border="╚$(printf '═%.0s' $(seq 1 $((max_len + 2))))╝"

	# --- Вывод рамки с контентом ---
	echo -e "${BLUE}${top_border}${r}"
	for line in "${info_lines[@]}"; do
	  clean_line=$(echo "$line" | sed -E 's/\x1B\[[0-9;]*[mK]//g')
	  line_length=$(echo -n "$clean_line" | wc -m)
	  padding=$((max_len - line_length))
	  printf "${BLUE}║ ${YELLOW}%s%*s ${BLUE}║\n" "$line" "$padding" ""
	done
	echo -e "${BLUE}${bottom_border}${r}"
	echo
}

# Функция логирования
log() {
    echo -e "${CYAN}$(date '+%Y-%m-%d %H:%M:%S')${NC} - $1" | tee -a "$LOG_FILE"
}

# Функция отображения меню
show_menu() {
    echo -e "${BLUE}$(t "menu_title")${NC}"
    echo -e "${GREEN}$(t "menu_option1")${NC}"
    echo -e "${NC}$(t "menu_option2")${NC}"
    echo -e "${RED}$(t "menu_option3")${NC}"
    echo -e "${NC}$(t "menu_option4")${NC}"
    echo -e "${NC}$(t "menu_prompt")${NC}"
}

# Функция просмотра лог файла
view_log() {
    echo -e "${YELLOW}$(t "view_log")${NC}"

    if [ -f "$LOG_FILE" ]; then
        echo -e "${GREEN}=== LOG FILE CONTENT ===${NC}"
        cat "$LOG_FILE"
        echo -e "${GREEN}=== END OF LOG FILE ===${NC}"
    else
        echo -e "${RED}$(t "log_not_found")${NC}"
    fi
}

# Функция удаления проекта
delete_project() {
    echo -e "${RED}$(t "delete_project")${NC}"

    if [ -d "$PROJECT_DIR" ]; then
        rm -rf "$PROJECT_DIR"
        echo -e "${GREEN}$(t "project_deleted")${NC}"
    else
        echo -e "${YELLOW}$(t "project_not_found")${NC}"
    fi

    if [ -f "$LOG_FILE" ]; then
        rm -f "$LOG_FILE"
        echo -e "${GREEN}$(t "log_not_deleted")${NC}"
    fi
}

# Инициализация логгирования
init_logging() {
    # Создаем лог файл в корневой директории
    touch "$LOG_FILE"
    exec > >(tee -a "$LOG_FILE") 2>&1
}

# Выбор языка
choose_language() {
    echo -e "${CYAN}$(t "lang_prompt")${NC}"
    echo -e "${NC}$(t "lang_option1")${NC}"
    echo -e "${NC}$(t "lang_option2")${NC}"
    read -p "Select (1/2): " lang_choice

    case $lang_choice in
        1)
            export LANG=ru_RU.UTF-8
            log "Russian language selected"
            ;;
        2)
            export LANG=en_US.UTF-8
            log "English language selected"
            ;;
        *)
            echo -e "${RED}$(t "invalid_choice")${NC}"
            log "Invalid language choice: $lang_choice"
            choose_language
            ;;
    esac
}

# Функция подтверждения
confirm_action() {
    local prompt="$1"
    local error_msg="$2"

    while true; do
        read -p "$(echo -e "${YELLOW}$prompt${NC} ")" response
        case $response in
            [Yy]* )
                log "User confirmed: $response"
                return 0
                ;;
            [Nn]* )
                log "User denied: $response"
                echo -e "${RED}$error_msg${NC}"
                return 1
                ;;
            * )
                echo -e "${RED}Please answer Y or N${NC}"
                ;;
        esac
    done
}

# Функция для добавления PATH в shell конфигурацию
setup_foundry_path() {
    log "Setting up Foundry PATH in shell configuration"
    echo -e "${CYAN}$(t "updating_shell")${NC}"

    local foundry_path="export PATH=\"\$PATH:/root/.foundry/bin\""

    # Добавляем в ~/.bash_profile если не существует
    if ! grep -q "foundry" ~/.bash_profile 2>/dev/null; then
        echo "$foundry_path" >> ~/.bash_profile
        log "Added Foundry PATH to ~/.bash_profile"
    fi

    # Добавляем в ~/.bashrc если не существует
    if ! grep -q "foundry" ~/.bashrc 2>/dev/null; then
        echo "$foundry_path" >> ~/.bashrc
        log "Added Foundry PATH to ~/.bashrc"
    fi

    # Применяем изменения
    source ~/.bash_profile
    source ~/.bashrc
    log "Shell configuration updated and reloaded"
}

# Функция для добавления переменных в .env файл
add_to_env() {
    local key="$1"
    local value="$2"
    local env_file=".env"  # Теперь используем относительный путь от текущей директории

    # Если .env файл существует, обновляем переменную
    if [ -f "$env_file" ]; then
        # Создаем временный файл в /tmp для безопасности
        local temp_file=$(mktemp)

        # Удаляем существующую переменную если есть и добавляем новую
        grep -v "^$key=" "$env_file" > "$temp_file" 2>/dev/null
        echo "${key}=\"${value}\"" >> "$temp_file"

        # Заменяем оригинальный файл
        mv "$temp_file" "$env_file"
    else
        # Просто создаем новый файл с переменной
        echo "${key}=\"${value}\"" > "$env_file"
    fi

    log "Added $key to .env file"
}

# Функция для автоматического извлечения информации о кошельке
extract_wallet_info() {
    echo -e "${CYAN}$(t "extracting_wallet_info")${NC}"

    # Извлекаем адрес из вывода (ищем строку с "Address:")
    local extracted_address=$(echo "$wallet_output" | grep -oP 'Address:\s+\K0x[a-fA-F0-9]{40}')

    # Извлекаем приватный ключ из вывода (ищем строку с "Private key:")
    local extracted_private_key=$(echo "$wallet_output" | grep -oP 'Private key:\s+\K0x[a-fA-F0-9]{64}')

    if [ -n "$extracted_address" ] && [ -n "$extracted_private_key" ]; then
        WALLET_ADDRESS="$extracted_address"
        PRIVATE_KEY="$extracted_private_key"
        echo -e "${GREEN}✓ Wallet address extracted: $WALLET_ADDRESS${NC}"
        echo -e "${GREEN}✓ Private key extracted${NC}"
        return 0
    else
        echo -e "${YELLOW}⚠ Could not automatically extract wallet info, manual input required${NC}"
        return 1
    fi
}

# Функция для автоматического извлечения информации о развертывании
extract_deployment_info() {
    echo -e "${CYAN}$(t "extracting_deployment_info")${NC}"

    # Извлекаем адрес контракта (ищем строку с "Deployed to:")
    local extracted_contract=$(echo "$deployment_output" | grep -oP 'Deployed to:\s+\K0x[a-fA-F0-9]{40}')

    # Извлекаем хэш транзакции (ищем строку с "Transaction hash:")
    local extracted_txhash=$(echo "$deployment_output" | grep -oP 'Transaction hash:\s+\K0x[a-fA-F0-9]{64}')

    if [ -n "$extracted_contract" ] && [ -n "$extracted_txhash" ]; then
        CONTRACT_ADDRESS="$extracted_contract"
        TXHASH="$extracted_txhash"
        echo -e "${GREEN}✓ Contract address extracted: $CONTRACT_ADDRESS${NC}"
        echo -e "${GREEN}✓ Transaction hash extracted: $TXHASH${NC}"
        return 0
    else
        echo -e "${YELLOW}⚠ Could not automatically extract deployment info, manual input required${NC}"
        return 1
    fi
}

# Основная функция деплоя
deploy_contract() {
    # Инициализация логгирования
    init_logging

    log "=== Starting Arc Testnet Deployment Script ==="
    echo -e "${GREEN}$(t "deploy_started")${NC}"

	echo ""
    # Шаг 1: Проверка и установка Foundry
    log "Step 1: Checking Foundry installation"
    echo -e "${CYAN}$(t "checking_foundry")${NC}"

    if ! command -v forge &> /dev/null; then
        echo -e "${YELLOW}$(t "foundry_not_found")${NC}"
        echo -e "${BLUE}$(t "downloading_foundry")${NC}"

        echo ""
        # Скачивание и установка Foundry
        curl -L https://foundry.paradigm.xyz | bash
        if [ $? -ne 0 ]; then
            log "Error downloading Foundry"
            echo -e "${RED}$(t "error")${NC}"
            return 1
        fi

		echo ""
        echo -e "${BLUE}$(t "installing_foundry")${NC}"
        ~/.foundry/bin/foundryup

        # Настройка PATH
        setup_foundry_path

        # Экспортируем PATH для текущей сессии
        export PATH="$PATH:/root/.foundry/bin"

		echo ""
        echo -e "${GREEN}$(t "foundry_installed")${NC}"
        log "Foundry installed successfully"
    else
        log "Foundry already installed"
    fi

    echo ""
    # Шаг 2: Инициализация проекта
    log "Step 2: Initializing project"
    echo -e "${CYAN}$(t "init_project")${NC}"


    forge init "$PROJECT_DIR" && cd "$PROJECT_DIR"
    if [ $? -ne 0 ]; then
        log "Error initializing project"
        echo -e "${RED}$(t "error")${NC}"
        return 1
    fi

	echo ""
    # Шаг 3: Создание .env файла в папке проекта с базовыми переменными
    log "Step 3: Creating .env file"
    echo -e "${GREEN}$(t "creating_env")${NC}"

    echo ""
    # Создаем базовый .env файл с RPC URL
    cat > .env << 'EOF'
ARC_TESTNET_RPC_URL="https://rpc.testnet.arc.network"
EOF
    log "Created .env file with ARC_TESTNET_RPC_URL"

	echo ""
    # Шаг 4: Удаление Counter.sol
    log "Step 4: Deleting Counter.sol"
    echo -e "${YELLOW}$(t "deleting_counter")${NC}"

    rm -f src/Counter.sol

	echo ""
    # Шаг 4.1: Удаление тестового файла Counter.t.sol
    log "Step 4.1: Deleting Counter.t.sol test file"
    echo -e "${YELLOW}$(t "deleting_counter_test")${NC}"

    rm -f test/Counter.t.sol

	echo ""
    # Шаг 5: Создание HelloArchitect.sol
    log "Step 5: Creating HelloArchitect.sol"
    echo -e "${GREEN}$(t "creating_contract")${NC}"

    cat > src/HelloArchitect.sol << 'EOF'
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract HelloArchitect {
    string private greeting;

    // Event emitted when the greeting is changed
    event GreetingChanged(string newGreeting);

    // Constructor that sets the initial greeting to "Hello Architect!"
    constructor() {
        greeting = "Hello Architect!";
    }

    // Setter function to update the greeting
    function setGreeting(string memory newGreeting) public {
        greeting = newGreeting;
        emit GreetingChanged(newGreeting);
    }

    // Getter function to return the current greeting
    function getGreeting() public view returns (string memory) {
        return greeting;
    }
}
EOF

	echo ""
    # Шаг 6: Удаление директории script
    log "Step 6: Deleting script directory"
    echo -e "${YELLOW}$(t "deleting_scripts")${NC}"

    rm -rf script

	echo ""
    # Шаг 7: Создание тестов
    log "Step 7: Creating tests"
    echo -e "${GREEN}$(t "creating_tests")${NC}"

    cat > test/HelloArchitect.t.sol << 'EOF'
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import "forge-std/Test.sol";
import "../src/HelloArchitect.sol";

contract HelloArchitectTest is Test {
    HelloArchitect helloArchitect;

    function setUp() public {
        helloArchitect = new HelloArchitect();
    }

    function testInitialGreeting() public view {
        string memory expected = "Hello Architect!";
        string memory actual = helloArchitect.getGreeting();
        assertEq(actual, expected);
    }

    function testSetGreeting() public {
        string memory newGreeting = "Welcome to Arc Chain!";
        helloArchitect.setGreeting(newGreeting);
        string memory actual = helloArchitect.getGreeting();
        assertEq(actual, newGreeting);
    }

    function testGreetingChangedEvent() public {
        string memory newGreeting = "Building on Arc!";

        // Expect the GreetingChanged event to be emitted
        vm.expectEmit(true, true, true, true);
        emit HelloArchitect.GreetingChanged(newGreeting);

        helloArchitect.setGreeting(newGreeting);
    }
}
EOF

	echo ""
    # Шаг 8: Запуск тестов
    log "Step 8: Running tests"
    echo -e "${BLUE}$(t "running_tests")${NC}"

    forge test
    if [ $? -ne 0 ]; then
        log "Tests failed"
        echo -e "${RED}$(t "error")${NC}"
        return 1
    fi

	echo ""
    # Шаг 9: Компиляция контракта
    log "Step 9: Compiling contract"
    echo -e "${BLUE}$(t "compiling_contract")${NC}"

    forge build
    if [ $? -ne 0 ]; then
        log "Compilation failed"
        echo -e "${RED}$(t "error")${NC}"
        return 1
    fi

	echo ""
    # Шаг 10: Выбор типа кошелька
    log "Step 10: Wallet selection"
    echo -e "${PURPLE}$(t "wallet_selection")${NC}"
    echo -e "${NC}$(t "wallet_option1")${NC}"
    echo -e "${NC}$(t "wallet_option2")${NC}"
    read -p "Select (1/2): " wallet_choice
	echo ""

    case $wallet_choice in
        1)
            # Создание нового кошелька
            log "User selected: Create new wallet"
            echo -e "${PURPLE}$(t "generating_wallet")${NC}"

			echo ""
            # Генерируем кошелек и захватываем вывод
            wallet_output=$(cast wallet new)
            if [ $? -ne 0 ]; then
                log "Wallet generation failed"
                echo -e "${RED}$(t "error")${NC}"
                return 1
            fi

            echo -e "${GREEN}$wallet_output${NC}"

			echo ""
            # Автоматически извлекаем информацию о кошельке
            if ! extract_wallet_info; then
                # Если автоматическое извлечение не удалось, запрашиваем вручную
				echo ""
                echo -e "${CYAN}$(t "address_prompt")${NC}"
                read -p "> " WALLET_ADDRESS
                echo ""
                echo -e "${CYAN}$(t "wallet_prompt")${NC}"
                read -p "> " PRIVATE_KEY
            fi
            ;;
        2)
            # Импорт существующего кошелька
            log "User selected: Import existing wallet"
            echo -e "${BLUE}$(t "import_wallet")${NC}"

			echo ""
            # Запрашиваем приватный ключ
            echo -e "${CYAN}$(t "enter_private_key")${NC}"
            read -p "> " PRIVATE_KEY

            # Проверяем формат приватного ключа
            if [[ ! $PRIVATE_KEY =~ ^0x[a-fA-F0-9]{64}$ ]]; then
                echo -e "${RED}$(t "invalid_private_key")${NC}"
                log "Invalid private key format provided"
                return 1
            fi

			echo ""
            # Извлекаем адрес из приватного ключа
            echo -e "${CYAN}$(t "extracting_address")${NC}"
            WALLET_ADDRESS=$(cast wallet address --private-key "$PRIVATE_KEY")
            if [ $? -ne 0 ]; then
                log "Failed to extract address from private key"
                echo -e "${RED}$(t "error")${NC}"
                return 1
            fi

            echo -e "${GREEN}✓ Wallet address extracted: $WALLET_ADDRESS${NC}"
            echo -e "${GREEN}✓ Private key verified${NC}"
            ;;
        *)
            echo ""
			echo -e "${RED}$(t "invalid_choice")${NC}"
            log "Invalid wallet choice: $wallet_choice"
            return 1
            ;;
    esac

	echo ""
    # Добавляем в .env файл автоматически (теперь функция работает с текущей директорией)
    echo -e "${GREEN}$(t "auto_env")${NC}"
    add_to_env "PRIVATE_KEY" "$PRIVATE_KEY"
    add_to_env "WALLET_ADDRESS" "$WALLET_ADDRESS"

	echo ""
    # Шаг 11: Перезагрузка переменных окружения
    log "Step 11: Reloading environment"
    echo -e "${CYAN}$(t "reload_env")${NC}"
    source .env

	echo ""
    # Шаг 12: Запрос тестовых токенов
    log "Step 12: Faucet confirmation"
    if ! confirm_action "$(t "faucet_prompt")" "$(t "error")"; then
        return 1
    fi

	echo ""
    # Шаг 13: Развертывание контракта
    log "Step 13: Deploying contract"
    echo -e "${GREEN}$(t "deploying_contract")${NC}"

    deployment_output=$(forge create src/HelloArchitect.sol:HelloArchitect \
        --rpc-url $ARC_TESTNET_RPC_URL \
        --private-key $PRIVATE_KEY \
        --broadcast)

    if [ $? -ne 0 ]; then
        log "Contract deployment failed"
        echo -e "${RED}$(t "error")${NC}"
        return 1
    fi

    echo -e "${GREEN}$deployment_output${NC}"

	echo ""
    # Автоматически извлекаем информацию о развертывании
    if ! extract_deployment_info; then
        # Если автоматическое извлечение не удалось, запрашиваем вручную
		echo ""
        echo -e "${CYAN}$(t "contract_address_prompt")${NC}"
        read -p "> " CONTRACT_ADDRESS
		echo ""
        echo -e "${CYAN}$(t "txhash_prompt")${NC}"
        read -p "> " TXHASH
    fi

	echo ""
    # Добавляем в .env файл автоматически
    echo -e "${GREEN}$(t "auto_env")${NC}"
    add_to_env "HELLOARCHITECT_ADDRESS" "$CONTRACT_ADDRESS"
    add_to_env "TXHASH" "$TXHASH"

	echo ""
    # Шаг 14: Перезагрузка переменных окружения
    log "Step 14: Reloading environment again"
    source .env

	echo ""
    # Шаг 15: Подтверждение в эксплорере
    log "Step 15: Explorer confirmation"
    if ! confirm_action "$(t "explorer_prompt")" "$(t "error")"; then
        return 1
    fi

	echo ""
    # Шаг 16: Вызов функции контракта
    log "Step 16: Calling contract function"
    echo -e "${BLUE}$(t "calling_function")${NC}"

    cast call $HELLOARCHITECT_ADDRESS "getGreeting()(string)" \
        --rpc-url $ARC_TESTNET_RPC_URL

    if [ $? -ne 0 ]; then
        log "Contract call failed"
        echo -e "${RED}$(t "error")${NC}"
        return 1
    fi

	echo ""
    # Шаг 17: Финальное сообщение
    log "Step 17: Displaying success message"
    echo -e "${GREEN}$(t "success")${NC}"
    echo ""
    echo -e "${CYAN}$(t "next_steps")${NC}"
    echo -e "  - ${GREEN}$(t "step1")${NC}"
    echo -e "  - ${GREEN}$(t "step2")${NC}"
    echo -e "  - ${GREEN}$(t "step3")${NC}"

	echo ""
    log "=== Script completed successfully ==="
    echo ""
    echo -e "${BLUE}Log file: $LOG_FILE${NC}"
    echo -e "${BLUE}Environment file: $(pwd)/.env${NC}"
    echo ""

    # Показываем содержимое .env файла
    echo -e "${GREEN}=== CURRENT .ENV FILE ===${NC}"
    cat .env
    echo -e "${GREEN}=== END OF .ENV FILE ===${NC}"
    echo ""

    # Возвращаемся в корневую директорию
    cd ..

    return 0
}

# Главное меню
main_menu() {
    # Выбор языка при запуске скрипта
    choose_language

    while true; do
        show_logo
        show_menu

        read -p "> " choice

        case $choice in
            1)
                echo ""
                deploy_contract
                echo ""
                read -p "$(echo -e "${YELLOW}Press Enter to continue...${NC}")" dummy
                ;;
            2)
                echo ""
                view_log
                echo ""
                read -p "$(echo -e "${YELLOW}Press Enter to continue...${NC}")" dummy
                ;;
            3)
                echo ""
                if confirm_action "Are you sure you want to delete the project folder? (Y/N)" "Deletion cancelled"; then
                    delete_project
                fi
                echo ""
                read -p "$(echo -e "${YELLOW}Press Enter to continue...${NC}")" dummy
                ;;
            4)
                echo -e "${GREEN}$(t "goodbye")${NC}"
                exit 0
                ;;
            *)
                echo -e "${RED}Invalid option. Please choose 1-4${NC}"
                sleep 2
                ;;
        esac
    done
}

# Запуск главного меню
main_menu
