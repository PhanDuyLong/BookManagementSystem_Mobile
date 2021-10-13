abstract class FormSubmissionStatus {
  const FormSubmissionStatus();
}

class InitalFormStatus extends FormSubmissionStatus {
  const InitalFormStatus();
}

class FormSubmitting extends FormSubmissionStatus{}

class SubmissionSuccess extends FormSubmissionStatus{}

class SubmissionFailed extends FormSubmissionStatus{
}

