<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="contact-form">

  <form class="form-horizontal" role="form" method="post" action="">
    <xsl:for-each select="/data/events/contact-message">
      <div>
        <xsl:attribute name="class">
          <xsl:choose>
            <xsl:when test="@result = 'error'">
              <xsl:text>alert alert-danger</xsl:text>
            </xsl:when>
            <xsl:when test="filter/@status = 'failed'">
              <xsl:text>alert</xsl:text>
            </xsl:when>
            <xsl:otherwise>
              <xsl:text>alert alert-success</xsl:text>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:attribute>
        <p>
          <xsl:choose>
            <xsl:when test="@result = 'error'">
              <strong>Your submission is incomplete! </strong>
              <xsl:text>The system encountered errors while sending your email. Please check if all the required fields have been filled.</xsl:text>
            </xsl:when>
            <xsl:when test="filter/@status = 'failed'">
              <strong>System error! </strong>
              <xsl:text>The system encountered technical problems while sending your email.</xsl:text>
            </xsl:when>
            <xsl:otherwise>
              <strong>Success! </strong>
              <xsl:text>Your email was sent successfully.</xsl:text>
            </xsl:otherwise>
          </xsl:choose>
        </p>
      </div>
      <br/>
    </xsl:for-each>

    <input name="MAX_FILE_SIZE" type="hidden" value="5242880" />

    <div>
      <xsl:attribute name="class">
        <xsl:choose>
          <xsl:when test="/data/events/contact-message/name">
            <xsl:text>form-group has-error</xsl:text>
          </xsl:when>
          <xsl:when test="/data/events/contact-message/@result = 'success'">
            <xsl:text>form-group has-success</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text>form-group</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>
      <label class="col-lg-2 control-label" for="fields-name">Full Name</label>
      <div class="col-lg-9">
        <input class="form-control" name="fields[name]" type="text" placeholder="Full Name">
          <xsl:if test="/data/events/contact-message/post-values/name">
            <xsl:attribute name="value">
              <xsl:value-of select="/data/events/contact-message/post-values/name"/>
            </xsl:attribute>
          </xsl:if>
        </input>
        <xsl:if test="/data/events/contact-message/name">
          <span class="help-block">
            <xsl:value-of select="/data/events/contact-message/name/@message"/>
          </span>
        </xsl:if>
      </div>
      <br/>
    </div>

    <div>
      <xsl:attribute name="class">
        <xsl:choose>
          <xsl:when test="/data/events/contact-message/email">
            <xsl:text>form-group has-error</xsl:text>
          </xsl:when>
          <xsl:when test="/data/events/contact-message/@result = 'success'">
            <xsl:text>form-group has-success</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text>form-group</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>
      <label class="col-lg-2 control-label" for="fields-email">Email</label>
      <div class="col-lg-9">
        <input class="form-control" name="fields[email]" type="text" placeholder="Email Address">
          <xsl:if test="/data/events/contact-message/post-values/email">
            <xsl:attribute name="value">
              <xsl:value-of select="/data/events/contact-message/post-values/email"/>
            </xsl:attribute>
          </xsl:if>
        </input>
        <xsl:if test="/data/events/contact-message/email">
          <span class="help-block">
            <xsl:value-of select="/data/events/contact-message/email/@message"/>
          </span>
        </xsl:if>
      </div>
      <br/>
    </div>

    <div>
      <xsl:attribute name="class">
        <xsl:choose>
          <xsl:when test="/data/events/contact-message/phone">
            <xsl:text>form-group has-error</xsl:text>
          </xsl:when>
          <xsl:when test="/data/events/contact-message/@result = 'success'">
            <xsl:text>form-group has-success</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text>form-group</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>
      <label class="col-lg-2 control-label" for="fields-phone">Phone</label>
      <div class="col-lg-9">
        <input class="form-control" name="fields[phone]" type="text" placeholder="Phone Number">
          <xsl:if test="/data/events/contact-message/post-values/phone">
            <xsl:attribute name="value">
              <xsl:value-of select="/data/events/contact-message/post-values/phone"/>
            </xsl:attribute>
          </xsl:if>
        </input>
        <xsl:if test="/data/events/contact-message/phone">
          <span class="help-block">
            <xsl:value-of select="/data/events/contact-message/phone/@message"/>
          </span>
        </xsl:if>
      </div>
      <br/>
    </div>

    <div>
      <xsl:attribute name="class">
        <xsl:choose>
          <xsl:when test="/data/events/contact-message/inquiry">
            <xsl:text>form-group has-error</xsl:text>
          </xsl:when>
          <xsl:when test="/data/events/contact-message/@result = 'success'">
            <xsl:text>form-group has-success</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text>form-group</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>
      <label class="col-lg-2 control-label" for="fields-inquiry">Subject:</label>
      <div class="col-lg-9">
        <select class="form-control" name="fields[inquiry]">
          <option value="Choose an option:">
            <xsl:if test="/data/events/contact-message/post-values/inquiry = 'Choose an option:'">
              <xsl:attribute name="selected"></xsl:attribute>
            </xsl:if>
            <xsl:text>Choose an option:</xsl:text>
          </option>
          <option value="General Inquiry">
            <xsl:if test="/data/events/contact-message/post-values/inquiry = 'General Inquiry'">
              <xsl:attribute name="selected"></xsl:attribute>
            </xsl:if>
            <xsl:text>General Inquiry</xsl:text>
          </option>
          <option value="Suggestion">
            <xsl:if test="/data/events/contact-message/post-values/inquiry = 'Suggestion'">
              <xsl:attribute name="selected"></xsl:attribute>
            </xsl:if>
            <xsl:text>Suggestion</xsl:text>
          </option>
          <option value="Store Issue/Help">
            <xsl:if test="/data/events/contact-message/post-values/inquiry = 'Store Issue/Help'">
              <xsl:attribute name="selected"></xsl:attribute>
            </xsl:if>
            <xsl:text>Store Issue/Help</xsl:text>
          </option>
        </select>
      </div>
      <br/>
    </div>

    <div>
      <xsl:attribute name="class">
        <xsl:choose>
          <xsl:when test="/data/events/contact-message/content">
            <xsl:text>form-group has-error</xsl:text>
          </xsl:when>
          <xsl:when test="/data/events/contact-message/@result = 'success'">
            <xsl:text>form-group has-success</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text>form-group</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>
      <label class="col-lg-2 control-label" for="fields-message">Message:</label>
      <div class="col-lg-9">
        <textarea class="form-control" name="fields[content]" rows="15">
          <xsl:if test="/data/events/contact-message/post-values/content">
            <xsl:value-of select="/data/events/contact-message/post-values/content"/>
          </xsl:if>
        </textarea>
        <xsl:if test="/data/events/contact-message/content">
          <span class="help-block">
            <xsl:value-of select="/data/events/contact-message/content/@message"/>
          </span>
        </xsl:if>
      </div>
      <br/>
    </div>

    <input name="fields[date][start][]" value="{$this-month}/{$this-day}/{$this-year}" type="hidden" />

    <input name="send-email[sender-email]" value="fields[email]" type="hidden" />
    <input name="send-email[sender-name]" value="{$website-name}" type="hidden" />
    <input name="send-email[reply-to-email]" value="fields[email]" type="hidden" />
    <input name="send-email[reply-to-name]" value="fields[name]" type="hidden" />
    <input name="send-email[subject]" value="fields[inquiry]" type="hidden" />
    <input name="send-email[body]" value="fields[inquiry],fields[content],fields[email],fields[name]" type="hidden" />
    <input name="send-email[recipient]" value="nate" type="hidden" />

    <input name="canofspam" value="{$canofspam}" type="hidden" />

    <div class="center">
      <input class="btn btn-large btn-block btn-primary" name="action[contact-message]" type="submit" value="Submit Form" />
    </div>

  </form>

</xsl:template>

</xsl:stylesheet>