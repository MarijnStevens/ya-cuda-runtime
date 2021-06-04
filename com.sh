echo "Connecting with virt.sock"

#/* All of the messages can respond with RESP_ERR in addition to what's listed below. */
# enum HOST_MSG_TYPE {
#     MSG_QUIT = 1,                   /* Expected response: RESP_OK */
#     MSG_RUN_PROCESS = 2,            /* Expected response: RESP_OK_U64 - process ID. */
#     MSG_KILL_PROCESS = 3,           /* Expected response: RESP_OK */
#     MSG_MOUNT_VOLUME = 4,           /* Expected response: RESP_OK */
#     MSG_UPLOAD_FILE = 5,            /* Expected response: RESP_OK */
#     MSG_QUERY_OUTPUT = 6,           /* Expected response: RESP_OK_BYTES - chunk of process\' output */
#     MSG_PUT_INPUT = 7,              /* Expected response: RESP_OK */
#     MSG_SYNC_FS = 8,                /* Expected response: RESP_OK */
# };
#
#enum SUB_MSG_QUIT_TYPE { SUB_MSG_QUIT_END = 0 /* End of sub-messages. */ };

# /* All options except binary path and argv are optional. */
# enum SUB_MSG_RUN_PROCESS_TYPE {
#     SUB_MSG_RUN_PROCESS_END = 0,  /* End of sub-messages. */
#     SUB_MSG_RUN_PROCESS_BIN,      /* Binary path. (BYTES) */
#     SUB_MSG_RUN_PROCESS_ARG,      /* Argv. (ARRAY) */
#     SUB_MSG_RUN_PROCESS_ENV,      /* Environment variables. (ARRAY) */
#     SUB_MSG_RUN_PROCESS_UID,      /* Uid to run as. (u32) */
#     SUB_MSG_RUN_PROCESS_GID,      /* Gid to run as. (u32) */
#     SUB_MSG_RUN_PROCESS_RFD,      /* Redirect a fd to the given path. (u32 + REDIRECT_FD_TYPE (1-byte) * + type sepcific data). */
#     SUB_MSG_RUN_PROCESS_CWD,      /* Path to set as current working directory. (BYTES) */
#     SUB_MSG_RUN_PROCESS_ENT,      /* This process is an entrypoint. (No body) */
# };

# enum SUB_MSG_KILL_PROCESS_TYPE {
#     SUB_MSG_KILL_PROCESS_END = 0, /* End of sub-messages. */
#     SUB_MSG_KILL_PROCESS_ID ,     /* ID of process. (u64) */
# };

# enum SUB_MSG_MOUNT_VOLUME_TYPE {
#     SUB_MSG_MOUNT_VOLUME_END = 0, /* End of sub-messages. */
#     SUB_MSG_MOUNT_VOLUME_TAG,     /* Mount tag. (BYTES) */
#     SUB_MSG_MOUNT_VOLUME_PATH,    /* Path to mount at. (BYTES) */
# };

# enum SUB_MSG_QUERY_OUTPUT_TYPE {
#     SUB_MSG_QUERY_OUTPUT_END = 0, /* End of sub-messages. */
#     SUB_MSG_QUERY_OUTPUT_ID,      /* ID of process. (u64) */
#     SUB_MSG_QUERY_OUTPUT_FD,      /* File descriptor (u8) */
#     SUB_MSG_QUERY_OUTPUT_OFF,     /* Offset in output (default = 0). (u64) */
#     SUB_MSG_QUERY_OUTPUT_LEN,     /* Requested length. (u64) */
# };

# enum SUB_MSG_PUT_INPUT_TYPE {
#     SUB_MSG_PUT_INPUT_END = 0,    /* End of sub-messages. */
#     SUG_MSG_PUT_INPUT_ID,         /* ID of process. (u64) */
#     SUB_MSG_PUT_INPUT_DATA,       /* Data to put on process' stdin. (BYTES) */
# };

# enum REDIRECT_FD_TYPE {
#     REDIRECT_FD_INVALID = -1,     /* Invalid type (useful only internally). */
#     REDIRECT_FD_FILE = 0,         /* Path to the file. (BYTES) */
#     REDIRECT_FD_PIPE_BLOCKING,    /* Buffer size. (u64) */
#     REDIRECT_FD_PIPE_CYCLIC,      /* Buffer size. (u64) */
# };

# enum GUEST_MSG_TYPE {
#     RESP_OK = 0,                  /* No body. */
#     RESP_OK_U64,                  /* Number. (u64) */
#     RESP_OK_BYTES,                /* Bytes. (BYTES) */
#     RESP_ERR,                     /* Error code. (u32) */
#     NOTIFY_OUTPUT_AVAILABLE,      /* ID of process and a file descriptor. (u64 + u32) */
#     NOTIFY_PROCESS_DIED,          /* ID of process and exit reason (two bytes). (u64 + u8 + u8) */
# };

{
  echo -e "2\0"  # MSG_RUN_PROCESS
  echo -e "crash\0"
} | nc -U virt.sock

echo $RETURN

IFS= read -r content
echo "${content}"
