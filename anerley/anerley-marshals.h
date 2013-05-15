
#ifndef __anerley_marshal_MARSHAL_H__
#define __anerley_marshal_MARSHAL_H__

#include	<glib-object.h>

G_BEGIN_DECLS

/* VOID:STRING,OBJECT (anerley-marshals.list:1) */
extern void anerley_marshal_VOID__STRING_OBJECT (GClosure     *closure,
                                                 GValue       *return_value,
                                                 guint         n_param_values,
                                                 const GValue *param_values,
                                                 gpointer      invocation_hint,
                                                 gpointer      marshal_data);

G_END_DECLS

#endif /* __anerley_marshal_MARSHAL_H__ */

