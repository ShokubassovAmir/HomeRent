@extends('layouts.app')
@section('head')
	<link href="{{ asset('css/contact.css') }}" rel="stylesheet">
@endsection
@section('content')
<div id="bravo_content-wrapper">
	<div class="bravo_content">
		<div class="container">
			<div class="row section">
				<div class="col-md-5">
					<div role="form" class="form_wrapper" lang="en-US" dir="ltr">
						<form method="post" action="{{url('/contact/store')}}"  class="bookcore-form">
							{{csrf_field()}}
							<div class="contact-form">
								<div class="contact-header">
									<h3 style="font-family: baltica;">{{ __('Мы хотели бы услышать от вас') }} </h3>
									<p style="font-family: baltica;">{{ __('Отправьте нам сообщение, и мы ответим как можно скорее') }} </p>

                                </div>
								@include('admin.message')

								<div class="contact-form">
									<div class="form-group">
										<input type="text" value="" placeholder=" {{ __('Имя') }} " name="name" class="form-control">
									</div>
									<div class="form-group">
										<input type="text" value="" placeholder="{{ __('Электронный адрес') }}" name="email" class="form-control">
									</div>

									<div class="form-group">
										 <textarea name="message" cols="40" rows="10" class="form-control textarea" placeholder="{{ __('Сообщение') }}"></textarea>
									</div>
									<div class="form-group">
										{{recaptcha_field('contact')}}
									</div>
									<p><input type="submit" value="{{ __('Отправить сообщение') }}" class="form-control submit btn btn-primary"></p></div></div>
							</form>
					</div>
				</div>

				<div class="offset-lg-2 col-md-12 col-lg-5">
				<div class="contact-info">
						<div class="info-bg">
							<img src="https://bookingcore.org/uploads/demo/general/bg-contact.jpg" class="img-responsive" alt="We'd love to hear from you">
						</div>
						<div class="info-content">
							<div class="sub">
								<p></p>
								<h3>HomeRent</h3>
								<p>&nbsp;</p>
								<p>&nbsp;</p>
								<p>&nbsp;</p>
								<p>&nbsp;</p>
								<p>&nbsp;</p>
								<p>+7 747 853 37 43</p>
								<p>
								support@homerent.com
								</p>
								<p style="font-weight: bold; ">Алматы, Казахстан</p>
								<p>	</p>
							</div>
						</div>
				</div>
				</div>
			</div>
		</div>
	</div>
</div>
@endsection

@section('footer')

@endsection
