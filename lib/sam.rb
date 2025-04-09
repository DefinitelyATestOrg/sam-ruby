# frozen_string_literal: true

# Standard libraries.
require "English"
require "cgi"
require "date"
require "erb"
require "etc"
require "json"
require "net/http"
require "pathname"
require "rbconfig"
require "securerandom"
require "set"
require "stringio"
require "time"
require "uri"

# We already ship the preferred sorbet manifests in the package itself.
# `tapioca` currently does not offer us a way to opt out of unnecessary compilation.
if Object.const_defined?(:Tapioca) && caller.chain([$PROGRAM_NAME]).chain(ARGV).grep(/tapioca/)
  Warning.warn(
    <<~WARN
      \n
      ⚠️ skipped loading of "sam" gem under `tapioca`.

      This message is normal and expected if you are running a `tapioca` command, and does not impact `.rbi` generation.
      \n
    WARN
  )
  return
end

# Gems.
require "connection_pool"

# Package files.
require_relative "sam/version"
require_relative "sam/internal/util"
require_relative "sam/internal/type/converter"
require_relative "sam/internal/type/unknown"
require_relative "sam/internal/type/boolean"
require_relative "sam/internal/type/io_like"
require_relative "sam/internal/type/enum"
require_relative "sam/internal/type/union"
require_relative "sam/internal/type/array_of"
require_relative "sam/internal/type/hash_of"
require_relative "sam/internal/type/base_model"
require_relative "sam/internal/type/base_page"
require_relative "sam/internal/type/base_stream"
require_relative "sam/internal/type/request_parameters"
require_relative "sam/internal"
require_relative "sam/request_options"
require_relative "sam/errors"
require_relative "sam/internal/transport/base_client"
require_relative "sam/internal/transport/pooled_net_requester"
require_relative "sam/client"
require_relative "sam/internal/jsonl_stream"
require_relative "sam/models/complete_create_params"
require_relative "sam/models/complete_create_response"
require_relative "sam/models/message_count_tokens_beta_params"
require_relative "sam/models/message_count_tokens_beta_response"
require_relative "sam/models/message_count_tokens_params"
require_relative "sam/models/message_count_tokens_response"
require_relative "sam/models/message_create_params"
require_relative "sam/models/message_create_response"
require_relative "sam/models/messages/batch_cancel_beta_params"
require_relative "sam/models/messages/batch_cancel_beta_response"
require_relative "sam/models/messages/batch_cancel_params"
require_relative "sam/models/messages/batch_cancel_response"
require_relative "sam/models/messages/batch_create_params"
require_relative "sam/models/messages/batch_create_response"
require_relative "sam/models/messages/batch_delete_params"
require_relative "sam/models/messages/batch_delete_response"
require_relative "sam/models/messages/batches/beta_true_delete_params"
require_relative "sam/models/messages/batches/beta_true_delete_response"
require_relative "sam/models/messages/batches/beta_true_retrieve_params"
require_relative "sam/models/messages/batches/beta_true_retrieve_response"
require_relative "sam/models/messages/batches_beta_true_create_params"
require_relative "sam/models/messages/batches_beta_true_create_response"
require_relative "sam/models/messages/batches_beta_true_list_params"
require_relative "sam/models/messages/batches_beta_true_list_response"
require_relative "sam/models/messages/batch_list_params"
require_relative "sam/models/messages/batch_list_response"
require_relative "sam/models/messages/batch_results_beta_params"
require_relative "sam/models/messages/batch_results_beta_response"
require_relative "sam/models/messages/batch_results_params"
require_relative "sam/models/messages/batch_results_response"
require_relative "sam/models/messages/batch_retrieve_params"
require_relative "sam/models/messages/batch_retrieve_response"
require_relative "sam/models/messages_beta_true_create_params"
require_relative "sam/models/messages_beta_true_create_response"
require_relative "sam/models/model_list_params"
require_relative "sam/models/model_list_response"
require_relative "sam/models/model_retrieve_beta_params"
require_relative "sam/models/model_retrieve_beta_response"
require_relative "sam/models/model_retrieve_params"
require_relative "sam/models/model_retrieve_response"
require_relative "sam/models/models_beta_true_list_params"
require_relative "sam/models/models_beta_true_list_response"
require_relative "sam/models/sam_plop_plop_create_message_params"
require_relative "sam/models/sam_plop_plop_create_message_response"
require_relative "sam/resources/complete"
require_relative "sam/resources/messages"
require_relative "sam/resources/messages/batches"
require_relative "sam/resources/messages/batches/beta_true"
require_relative "sam/resources/messages/batches_beta_true"
require_relative "sam/resources/messages_beta_true"
require_relative "sam/resources/models"
require_relative "sam/resources/models_beta_true"
require_relative "sam/resources/sam_plop_plop"
require_relative "sam/resources/store"
require_relative "sam/resources/store/orders"
require_relative "sam/resources/user"
