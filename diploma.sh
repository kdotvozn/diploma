#!/bin/bash

bin='/usr/local/bin'        # cli location
share='/usr/share/diploma'  # files location
install='files/src/install'
uninstall='files/src/uninstall'
msg='files/src/msg'

[ $2='--force' ] || echo Unknown option

case $1 in
#diploma
    install)
        case $2 in
            ''|--force)
                $install $2
                ;;
        esac
        ;;
    uninstall)
        case $2 in
            ''|--force)
                $uninstall $2
                ;;
        esac
        ;;
    fut-update)
        echo "Run this in the repository"
        git clone git@github.com:kdotvozn/diploma.git
        cd diploma
        ./diploma install
        cd ..
        rm -rf diploma
        ;;
    
    version)
        $msg version
        ;;

    help)
        cat help.txt
        ;;

#aws
    login)
        echo "Console sign-in link for root: https://console.aws.amazon.com/console/home?nc2=h_ct&src=header-signin"
        echo "or for IAM user: https://694509815096.signin.aws.amazon.com/console"
        aws configure
        ;;

    unset-creds)
        echo "to unset creds, run:"
        echo "unset AWS_ACCESS_KEY_ID"
        echo "unset AWS_SECRET_ACCESS_KEY"
        ;;

    creds)
        echo "AWS_ACCESS_KEY_ID"
        echo "AWS_SECRET_ACCESS_KEY"
        ;;

    check-creds)
        echo $AWS_ACCESS_KEY_ID
        echo $AWS_SECRET_ACCESS_KEY
        ;;

#terraform
    init)
        diploma login
        terraform init
        ;;

    plan)
        diploma init
        terraform plan
        ;;

    plan-only)
        terraform plan
        ;;

    apply)
        
        diploma apply-here 
    ;;

    apply-backend)
        -chdir=backend_init
        cd backend_init
        diploma apply-here
        cd ..
        diploma apply-here 
    ;;

    apply-here)
        diploma init
        diploma plan-only
        terraform apply
        ;;

    apply-only)
        terraform apply
        ;;

    destroy)
        diploma init
        terraform destroy
        ;;

    destroy-only)
        terraform destroy
        terraform destroy -chdir=backend_init
        ;;

    tf-cleanup)
        find . -name '.terraform*' | xargs rm -rf
        ;;

    *) 
        echo 'WARNING: unexpected input'
        echo 'To install diploma, run `./diploma.sh install`'
        #here
        #backend
        #all
        exit 1

esac

