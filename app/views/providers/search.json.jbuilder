# frozen_string_literal: true

json.array! @providers, partial: "providers/provider", as: :provider
