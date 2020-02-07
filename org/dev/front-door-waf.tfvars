#Link to Terraform documentation for AFD WAF
#https://www.terraform.io/docs/providers/azurerm/r/front_door_firewall_policy.html


front-door-waf-settings = {
  waf1 = {
    name         = "TerraformPolicy"
    enabled      = true                   #default: true
    mode         = "Prevention"           #options: Prevention / Detection
    redirect_url = "https://www.bing.com" #optional
    custom_rule = {
      cr1 = {
        name     = "Rule1"
        action   = "Block"     #options: Allow/Block/Log/Redirect
        enabled  = true        #default: true
        priority = 1           #default: 1
        type     = "MatchRule" #options: MatchRule / RateLimitRule
        match_condition = {
          match_variable     = "RequestHeader" #options: Cookies, PostArgs, QueryString, RemoteAddr, RequestBody, RequestHeader, RequestMethod, or RequestUri
          match_values       = ["windows"]
          operator           = "Contains"            #options: Any, BeginsWith, Contains, EndsWith, Equal, GeoMatch, GreaterThan, GreaterThanOrEqual, IPMatch, LessThan, LessThanOrEqual or RegEx
          selector           = "UserAgent"           #Used if matched_variable is  QueryString, PostArgs, RequestHeader or Cookies
          negation_condition = false                 #If result of condition is negative
          transforms         = ["Lowercase", "Trim"] #options: transforms - (Optional) Up to 5 transforms to apply. Possible values are Lowercase, RemoveNulls, Trim, Uppercase, URLDecode or URLEncode
        }
        rate_limit_duration_in_minutes = 1
        rate_limit_threshold           = 10

      } #add extra custom rules here
    }
    custom_block_response_status_code = 403 #options: 200, 403, 405, 406, or 429
    custom_block_response_body        = "PGh0bWw+CjxoZWFkZXI+PHRpdGxlPkhlbGxvPC90aXRsZT48L2hlYWRlcj4KPGJvZHk+CkhlbGxvIHdvcmxkCjwvYm9keT4KPC9odG1sPg=="

    managed_rule = {
      mr1 = {
        type    = "DefaultRuleSet"
        version = "1.0"
        exclusion = {
          ex1 = {
            match_variable = "QueryStringArgNames" #options: match_variable - (Required) The variable type to be excluded. Possible values are QueryStringArgNames, RequestBodyPostArgNames, RequestCookieNames, RequestHeaderNames
            operator       = "Equals"              #options: Equals, Contains, StartsWith, EndsWith, EqualsAny
            selector       = "not_suspicious"
          } # Add extra exclusions
        }
        override = {
          or1 = {
            rule_group_name = "PHP"
            exclusion = {
              ex1 = {
                match_variable = "QueryStringArgNames" #options: match_variable - (Required) The variable type to be excluded. Possible values are QueryStringArgNames, RequestBodyPostArgNames, RequestCookieNames, RequestHeaderNames
                operator       = "Equals"              #options: Equals, Contains, StartsWith, EndsWith, EqualsAny
                selector       = "not_suspicious"
              } #add extra override exclusions
            }
            rule = {
              r1 = {
                rule_id = "933100"
                action  = "Block" #options: Allow, Block, Log, or Redirect
                enabled = false   #default: true
                exclusion = {
                  ex1 = {
                    match_variable = "QueryStringArgNames" #options: match_variable - (Required) The variable type to be excluded. Possible values are QueryStringArgNames, RequestBodyPostArgNames, RequestCookieNames, RequestHeaderNames
                    operator       = "Equals"              #options: Equals, Contains, StartsWith, EndsWith, EqualsAny
                    selector       = "not_suspicious"
                  } #add extra rule exclusions
                }
              } #add extra rule to override
            }
          } #add extra overrides
        }
      } #add extra managed rules
    }
    tags = ""

  },
  waf2 = {
    name         = "TerraformPolicy2"
    enabled      = true                   #default: true
    mode         = "Prevention"           #options: Prevention / Detection
    redirect_url = "https://www.bing.com" #optional
    custom_rule = {
      cr1 = {
        name     = "Rule1"
        action   = "Block"     #options: Allow/Block/Log/Redirect
        enabled  = true        #default: true
        priority = 1           #default: 1
        type     = "MatchRule" #options: MatchRule / RateLimitRule
        match_condition = {
          match_variable     = "RequestHeader" #options: Cookies, PostArgs, QueryString, RemoteAddr, RequestBody, RequestHeader, RequestMethod, or RequestUri
          match_values       = ["windows"]
          operator           = "Contains"            #options: Any, BeginsWith, Contains, EndsWith, Equal, GeoMatch, GreaterThan, GreaterThanOrEqual, IPMatch, LessThan, LessThanOrEqual or RegEx
          selector           = "UserAgent"           #Used if matched_variable is  QueryString, PostArgs, RequestHeader or Cookies
          negation_condition = false                 #If result of condition is negative
          transforms         = ["Lowercase", "Trim"] #options: transforms - (Optional) Up to 5 transforms to apply. Possible values are Lowercase, RemoveNulls, Trim, Uppercase, URLDecode or URLEncode
        }
        rate_limit_duration_in_minutes = 1
        rate_limit_threshold           = 10

      } #add extra custom rules here
    }
    custom_block_response_status_code = 403 #options: 200, 403, 405, 406, or 429
    custom_block_response_body        = "PGh0bWw+CjxoZWFkZXI+PHRpdGxlPkhlbGxvPC90aXRsZT48L2hlYWRlcj4KPGJvZHk+CkhlbGxvIHdvcmxkCjwvYm9keT4KPC9odG1sPg=="

    managed_rule = {
      mr1 = {
        type    = "DefaultRuleSet"
        version = "1.0"
        exclusion = {
          ex1 = {
            match_variable = "QueryStringArgNames" #options: match_variable - (Required) The variable type to be excluded. Possible values are QueryStringArgNames, RequestBodyPostArgNames, RequestCookieNames, RequestHeaderNames
            operator       = "Equals"              #options: Equals, Contains, StartsWith, EndsWith, EqualsAny
            selector       = "not_suspicious"
          } # Add extra exclusions
        }
        override = {
          or1 = {
            rule_group_name = "PHP"
            exclusion = {
              ex1 = {
                match_variable = "QueryStringArgNames" #options: match_variable - (Required) The variable type to be excluded. Possible values are QueryStringArgNames, RequestBodyPostArgNames, RequestCookieNames, RequestHeaderNames
                operator       = "Equals"              #options: Equals, Contains, StartsWith, EndsWith, EqualsAny
                selector       = "not_suspicious"
              } #add extra override exclusions
            }
            rule = {
              r1 = {
                rule_id = "933100"
                action  = "Block" #options: Allow, Block, Log, or Redirect
                enabled = false   #default: true
                exclusion = {
                  ex1 = {
                    match_variable = "QueryStringArgNames" #options: match_variable - (Required) The variable type to be excluded. Possible values are QueryStringArgNames, RequestBodyPostArgNames, RequestCookieNames, RequestHeaderNames
                    operator       = "Equals"              #options: Equals, Contains, StartsWith, EndsWith, EqualsAny
                    selector       = "not_suspicious"
                  } #add extra rule exclusions
                }
              } #add extra rule to override
            }
          } #add extra overrides
        }
      } #add extra managed rules
    }
    tags = ""

  }


}
  
