# Cookbook Name:: pilolo
# Recipe:: mail
#
# 1) Postfix
# 2) Dovecot IMAP
# 3) Dovecot Sieve [optional]
# 4) Dovecot Managesieve [optional]
# 5) Spamassasin
#
# Copyright (C) 2013 Antono Vasiljev
# 

include_recipe 'postfix'
include_recipe 'dovecot'
