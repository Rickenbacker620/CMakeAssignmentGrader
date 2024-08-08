list(TRANSFORM STUDENT_IDS APPEND "_comments.pdf" OUTPUT_VARIABLE COMMENTS_TARGETS)

file(MAKE_DIRECTORY ${COMMENTS_ROOT_DIR})

add_custom_target(gen-comments
  DEPENDS ${COMMENTS_TARGETS}
  WORKING_DIRECTORY ${COMMENTS_ROOT_DIR}
  VERBATIM
)


foreach(STUDENT_ID ${STUDENT_IDS})
  add_custom_command(OUTPUT ${STUDENT_ID}_comments.pdf
    COMMAND pandoc -f markdown -t pdf -o ${COMMENTS_ROOT_DIR}/${STUDENT_ID}_comments.pdf
    ${ASSIGNMENTS_ROOT_DIR}/${STUDENT_ID}/comments.md
  )
endforeach()
