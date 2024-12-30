# Changelog

Automatically generated by [python-semantic-release](https://github.com/python-semantic-release/python-semantic-release), using [angular commits](https://github.com/angular/angular.js/blob/master/DEVELOPERS.md#commits) / [conventional commits](https://www.conventionalcommits.org/en/v1.0.0/).

{% if context.history.unreleased | length > 0 %}
{# UNRELEASED #}

## Unreleased

{% set categories = {
    "feature": "Features",
    "fix": "Bug Fixes",
    "chore": "Chores / Maintenance",
    "refactor": "Refactor",
    "documentation": "Documentation",
    "style": "Formatting",
    "build": "Build",
    "breaking": "Breaking Changes",
    "unknown": "Other"
} %}

{% for type_ in categories.keys() %}
{% set commits = context.history.unreleased[type_] %}
{% if commits %}
### {{ categories[type_] }}

{% for commit in commits %}
{% set message = commit.message.rstrip() %}
{% if "dependabot" in message or "automatically updating changelog" in message or "update pre-commit hooks" in message %}
{% continue %}
{% endif %}

{% if '(' in message and ')' in message %}
    {% set scope_start = message.index('(') + 1 %}
    {% set scope_end = message.index(')') %}
    {% set scope = message[scope_start:scope_end] %}
    {% set msg_no_ID = message[message.index(')')+2:] %}

    {# Detect issue/PR number #}
    {% set issue_pr_start = msg_no_ID.find('#') %}
    {% set issue_pr = '' %}
    {% if issue_pr_start != -1 %}
        {% set issue_pr_end = msg_no_ID.find(' ', issue_pr_start) %}
        {% if issue_pr_end == -1 %}
            {% set issue_pr_end = msg_no_ID | length %}
        {% endif %}
        {% set issue_pr = msg_no_ID[issue_pr_start:issue_pr_end] %}
        {% set msg_no_ID = msg_no_ID[:issue_pr_start] + msg_no_ID[issue_pr_end:] %}
    {% endif %}

    * **{{ scope }}**: {{ msg_no_ID }} ([`{{ commit.short_hash }}`]({{ commit.hexsha | commit_hash_url }})) {% if issue_pr %}{{ issue_pr }}{% endif %}
{% else %}
    {% set issue_pr_start = message.find('#') %}
    {% set issue_pr = '' %}
    {% if issue_pr_start != -1 %}
        {% set issue_pr_end = message.find(' ', issue_pr_start) %}
        {% if issue_pr_end == -1 %}
            {% set issue_pr_end = message | length %}
        {% endif %}
        {% set issue_pr = message[issue_pr_start:issue_pr_end] %}
        {% set msg_no_ID = message[:issue_pr_start] + message[issue_pr_end:] %}
    {% else %}
        {% set msg_no_ID = message %}
    {% endif %}

    * {{ msg_no_ID }} ([`{{ commit.short_hash }}`]({{ commit.hexsha | commit_hash_url }})) {% if issue_pr %}{{ issue_pr }}{% endif %}
{% endif %}
{% endfor %}
{% endif %}
{% endfor %}
{% endif %}

{% for version, release in context.history.released.items() %}
{# RELEASED #}

## {{ version.as_semver_tag() }} ({{ release.tagged_date.strftime("%Y-%m-%d") }})

{% for type_ in categories.keys() %}
{% set commits = release["elements"][type_] %}
{% if commits %}
### {{ categories[type_] }}

{% for commit in commits %}
{% set message = commit.message.rstrip() %}
{% if "dependabot" in message or "automatically updating changelog" in message or "update pre-commit hooks" in message %}
{% continue %}
{% endif %}

{% if '(' in message and ')' in message %}
    {% set scope_start = message.index('(') + 1 %}
    {% set scope_end = message.index(')') %}
    {% set scope = message[scope_start:scope_end] %}
    {% set msg_no_ID = message[message.index(')')+2:] %}

    {# Detect issue/PR number #}
    {% set issue_pr_start = msg_no_ID.find('#') %}
    {% set issue_pr = '' %}
    {% if issue_pr_start != -1 %}
        {% set issue_pr_end = msg_no_ID.find(' ', issue_pr_start) %}
        {% if issue_pr_end == -1 %}
            {% set issue_pr_end = msg_no_ID | length %}
        {% endif %}
        {% set issue_pr = msg_no_ID[issue_pr_start:issue_pr_end] %}
        {% set msg_no_ID = msg_no_ID[:issue_pr_start] + msg_no_ID[issue_pr_end:] %}
    {% endif %}

    * **{{ scope }}**: {{ msg_no_ID }} ([`{{ commit.short_hash }}`]({{ commit.hexsha | commit_hash_url }})) {% if issue_pr %}{{ issue_pr }}{% endif %}
{% else %}
    {% set issue_pr_start = message.find('#') %}
    {% set issue_pr = '' %}
    {% if issue_pr_start != -1 %}
        {% set issue_pr_end = message.find(' ', issue_pr_start) %}
        {% if issue_pr_end == -1 %}
            {% set issue_pr_end = message | length %}
        {% endif %}
        {% set issue_pr = message[issue_pr_start:issue_pr_end] %}
        {% set msg_no_ID = message[:issue_pr_start] + message[issue_pr_end:] %}
    {% else %}
        {% set msg_no_ID = message %}
    {% endif %}

    * {{ msg_no_ID }} ([`{{ commit.short_hash }}`]({{ commit.hexsha | commit_hash_url }})) {% if issue_pr %}{{ issue_pr }}{% endif %}
{% endif %}
{% endfor %}
{% endif %}
{% endfor %}
{% endfor %}
